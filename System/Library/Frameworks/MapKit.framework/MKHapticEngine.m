@implementation MKHapticEngine

- (MKHapticEngine)init
{
  MKHapticEngine *v2;
  UINotificationFeedbackGenerator *v3;
  UINotificationFeedbackGenerator *notificationGenerator;
  uint64_t v5;
  UIImpactFeedbackGenerator *feedbackGenerator;
  _UIDragSnappingFeedbackGenerator *v7;
  _UIDragSnappingFeedbackGenerator *dragSnappingGenerator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKHapticEngine;
  v2 = -[MKHapticEngine init](&v10, sel_init);
  if (v2)
  {
    v3 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA7D0]);
    notificationGenerator = v2->_notificationGenerator;
    v2->_notificationGenerator = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 3);
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = (UIImpactFeedbackGenerator *)v5;

    v7 = (_UIDragSnappingFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEAD08]);
    dragSnappingGenerator = v2->_dragSnappingGenerator;
    v2->_dragSnappingGenerator = v7;

  }
  return v2;
}

- (void)playSuccess
{
  -[UINotificationFeedbackGenerator notificationOccurred:](self->_notificationGenerator, "notificationOccurred:", 0);
}

- (void)prepare
{
  -[UIImpactFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
}

- (void)playFailure
{
  -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
}

- (void)draggedObjectLifted
{
  if (!self->_isDragging)
  {
    self->_isDragging = 1;
    -[_UIDragSnappingFeedbackGenerator userInteractionStarted](self->_dragSnappingGenerator, "userInteractionStarted");
    -[_UIDragSnappingFeedbackGenerator draggedObjectLifted](self->_dragSnappingGenerator, "draggedObjectLifted");
    -[_UIDragSnappingFeedbackGenerator prepare](self->_dragSnappingGenerator, "prepare");
  }
}

- (void)draggedObjectLanded
{
  if (self->_isDragging)
  {
    self->_isDragging = 0;
    -[_UIDragSnappingFeedbackGenerator draggedObjectLanded](self->_dragSnappingGenerator, "draggedObjectLanded");
    -[_UIDragSnappingFeedbackGenerator userInteractionEnded](self->_dragSnappingGenerator, "userInteractionEnded");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSnappingGenerator, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_notificationGenerator, 0);
}

@end
