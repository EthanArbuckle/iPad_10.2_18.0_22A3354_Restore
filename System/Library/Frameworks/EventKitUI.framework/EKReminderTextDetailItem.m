@implementation EKReminderTextDetailItem

- (id)_createEventDetailCell
{
  EKReminderDetailTextCell *v3;
  EKEvent *event;
  REMReminder *reminder;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  EKReminderDetailTextCell *v10;

  v3 = [EKReminderDetailTextCell alloc];
  event = self->super.super._event;
  reminder = self->super.super._reminder;
  v6 = -[EKReminderTextDetailItem showExtraSpaceAtBottom](self, "showExtraSpaceAtBottom");
  v7 = objc_msgSend((id)objc_opt_class(), "allowDataDetector");
  objc_msgSend((id)objc_opt_class(), "titleForCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "textFromEventAndReminderBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKReminderDetailTextCell initWithEvent:reminder:editable:showExtraSpaceAtBottom:allowDataDetector:title:textFromEventAndReminderBlock:](v3, "initWithEvent:reminder:editable:showExtraSpaceAtBottom:allowDataDetector:title:textFromEventAndReminderBlock:", event, reminder, 0, v6, v7, v8, v9);

  return v10;
}

- (BOOL)showExtraSpaceAtBottom
{
  return *(&self->super._cellNeedsUpdate + 1);
}

- (void)setShowExtraSpaceAtBottom:(BOOL)a3
{
  *(&self->super._cellNeedsUpdate + 1) = a3;
}

+ (id)textFromEventAndReminderBlock
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

+ (BOOL)allowDataDetector
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 1;
}

@end
