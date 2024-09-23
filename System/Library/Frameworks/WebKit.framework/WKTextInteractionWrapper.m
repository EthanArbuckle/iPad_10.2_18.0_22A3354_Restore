@implementation WKTextInteractionWrapper

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (WKTextInteractionWrapper)initWithView:(id)a3
{
  WKTextInteractionWrapper *v4;
  WKTextInteractionWrapper *v5;
  id v6;
  void *m_ptr;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKTextInteractionWrapper;
  v4 = -[WKTextInteractionWrapper init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    if (objc_msgSend(a3, "shouldUseAsyncInteractions"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C92720]);
      m_ptr = v5->_asyncTextInteraction.m_ptr;
      v5->_asyncTextInteraction.m_ptr = v6;
      if (m_ptr)
      {
        CFRelease(m_ptr);
        v6 = v5->_asyncTextInteraction.m_ptr;
      }
      objc_msgSend(v6, "setDelegate:", a3);
      objc_msgSend(a3, "addInteraction:", v5->_asyncTextInteraction.m_ptr);
    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC00]), "initWithView:", a3);
      v9 = v5->_textInteractionAssistant.m_ptr;
      v5->_textInteractionAssistant.m_ptr = (void *)v8;
      if (v9)
        CFRelease(v9);
    }
  }
  return v5;
}

- (void)setExternalContextMenuInteractionDelegate:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "setExternalContextMenuInteractionDelegate:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "setContextMenuInteractionDelegate:", a3);
}

- (void)stopShowEditMenuTimer
{
  void *m_ptr;

  m_ptr = self->_showEditMenuTimer.m_ptr;
  self->_showEditMenuTimer.m_ptr = 0;
  objc_msgSend(m_ptr, "invalidate");
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setGestureRecognizers
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "setGestureRecognizers");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "editabilityChanged");
}

- (void)didEndScrollingOrZooming
{
  _BOOL4 shouldRestoreEditMenuAfterOverflowScrolling;

  objc_msgSend(self->_textInteractionAssistant.m_ptr, "didEndScrollingOrZooming");
  shouldRestoreEditMenuAfterOverflowScrolling = self->_shouldRestoreEditMenuAfterOverflowScrolling;
  self->_shouldRestoreEditMenuAfterOverflowScrolling = 0;
  if (shouldRestoreEditMenuAfterOverflowScrolling)
    objc_msgSend(self->_asyncTextInteraction.m_ptr, "presentEditMenuForSelection");
}

- (void)deactivateSelection
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "deactivateSelection");
  objc_msgSend((id)objc_msgSend(self->_asyncTextInteraction.m_ptr, "textSelectionDisplayInteraction"), "setActivated:", 0);
  self->_showEditMenuAfterNextSelectionChange = 0;
  -[WKTextInteractionWrapper stopShowEditMenuTimer](self, "stopShowEditMenuTimer");
}

- (void)dealloc
{
  objc_super v3;

  -[WKTextInteractionWrapper stopShowEditMenuTimer](self, "stopShowEditMenuTimer");
  if (self->_asyncTextInteraction.m_ptr)
    objc_msgSend(objc_loadWeak((id *)&self->_view), "removeInteraction:", self->_asyncTextInteraction.m_ptr);
  v3.receiver = self;
  v3.super_class = (Class)WKTextInteractionWrapper;
  -[WKTextInteractionWrapper dealloc](&v3, sel_dealloc);
}

- (UIWKTextInteractionAssistant)textInteractionAssistant
{
  return (UIWKTextInteractionAssistant *)self->_textInteractionAssistant.m_ptr;
}

- (void)activateSelection
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "activateSelection");
  objc_msgSend((id)objc_msgSend(self->_asyncTextInteraction.m_ptr, "textSelectionDisplayInteraction"), "setActivated:", 1);
}

- (void)selectionChanged
{
  _BOOL4 showEditMenuAfterNextSelectionChange;
  void *v4;
  void *v5;
  void *m_ptr;

  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectionChanged");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "refreshKeyboardUI");
  -[WKTextInteractionWrapper stopShowEditMenuTimer](self, "stopShowEditMenuTimer");
  showEditMenuAfterNextSelectionChange = self->_showEditMenuAfterNextSelectionChange;
  self->_showEditMenuAfterNextSelectionChange = 0;
  if (showEditMenuAfterNextSelectionChange)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_showEditMenuTimerFired, 0, 0, 0.2);
    v5 = v4;
    if (v4)
      CFRetain(v4);
    m_ptr = self->_showEditMenuTimer.m_ptr;
    self->_showEditMenuTimer.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

- (void)willStartScrollingOverflow
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "willStartScrollingOverflow");
  self->_shouldRestoreEditMenuAfterOverflowScrolling = objc_msgSend(objc_loadWeak((id *)&self->_view), "isPresentingEditMenu");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "dismissEditMenuForSelection");
  objc_msgSend((id)objc_msgSend(self->_asyncTextInteraction.m_ptr, "textSelectionDisplayInteraction"), "setActivated:", 0);
}

- (void)didEndScrollingOverflow
{
  _BOOL4 shouldRestoreEditMenuAfterOverflowScrolling;

  objc_msgSend(self->_textInteractionAssistant.m_ptr, "didEndScrollingOverflow");
  shouldRestoreEditMenuAfterOverflowScrolling = self->_shouldRestoreEditMenuAfterOverflowScrolling;
  self->_shouldRestoreEditMenuAfterOverflowScrolling = 0;
  if (shouldRestoreEditMenuAfterOverflowScrolling)
    objc_msgSend(self->_asyncTextInteraction.m_ptr, "presentEditMenuForSelection");
  objc_msgSend((id)objc_msgSend(self->_asyncTextInteraction.m_ptr, "textSelectionDisplayInteraction"), "setActivated:", 1);
}

- (void)willStartScrollingOrZooming
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "willStartScrollingOrZooming");
  self->_shouldRestoreEditMenuAfterOverflowScrolling = objc_msgSend(objc_loadWeak((id *)&self->_view), "isPresentingEditMenu");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "dismissEditMenuForSelection");
}

- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(unint64_t)a6
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectionChangedWithGestureAt:withGesture:withState:withFlags:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "selectionChangedWithGestureAtPoint:gesture:state:flags:", a4, a5, a6, x, y);
}

- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(unint64_t)a5
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "selectionBoundaryAdjustedToPoint:touchPhase:flags:", a4, a5, x, y);
}

- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a4.length;
  location = a4.location;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "lookup:withRange:fromRect:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "showDictionaryForTextInContext:definingTextInRange:fromRect:", a3, location, length, x, y, width, height);
}

- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "showShareSheetFor:fromRect:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "shareText:fromRect:", a3, x, y, width, height);
}

- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "showTextServiceFor:fromRect:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "addShortcutForText:fromRect:", a3, x, y, width, height);
}

- (void)scheduleReplacementsForText:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "scheduleReplacementsForText:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "showReplacementsForText:", a3);
}

- (void)scheduleChineseTransliterationForText:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "scheduleChineseTransliterationForText:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "transliterateChineseForText:", a3);
}

- (void)translate:(id)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "translate:fromRect:");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "translateText:fromRect:", a3, x, y, width, height);
}

- (void)selectWord
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectWord");
  self->_showEditMenuAfterNextSelectionChange = 1;
}

- (void)selectAll:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectAll:", a3);
  self->_showEditMenuAfterNextSelectionChange = 1;
}

- (void)showEditMenuTimerFired
{
  -[WKTextInteractionWrapper stopShowEditMenuTimer](self, "stopShowEditMenuTimer");
  objc_msgSend(self->_asyncTextInteraction.m_ptr, "presentEditMenuForSelection");
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  void *m_ptr;

  m_ptr = self->_asyncTextInteraction.m_ptr;
  if (!m_ptr)
    m_ptr = self->_textInteractionAssistant.m_ptr;
  return (UIContextMenuInteraction *)objc_msgSend(m_ptr, "contextMenuInteraction");
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_showEditMenuTimer.m_ptr;
  self->_showEditMenuTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_asyncTextInteraction.m_ptr;
  self->_asyncTextInteraction.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_textInteractionAssistant.m_ptr;
  self->_textInteractionAssistant.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  objc_destroyWeak((id *)&self->_view);
}

@end
