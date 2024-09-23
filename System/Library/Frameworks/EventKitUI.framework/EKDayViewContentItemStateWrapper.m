@implementation EKDayViewContentItemStateWrapper

- (CGRect)backgroundRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[EKDayViewContentItem stagedFrame](self->_item, "stagedFrame");
  v4 = v3;
  -[EKDayViewContentItem stagedFrame](self->_item, "stagedFrame");
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)visibleHeight
{
  double result;

  -[EKDayViewContentItem visibleHeight](self->_item, "visibleHeight");
  return result;
}

- (BOOL)usesSmallText
{
  return -[EKDayViewContentItem usesSmallText](self->_item, "usesSmallText");
}

- (double)travelTime
{
  double result;

  -[EKDayViewContentItem travelTime](self->_item, "travelTime");
  return result;
}

- (double)travelTimeHeight
{
  double result;

  -[EKDayViewContentItem travelTimeHeight](self->_item, "travelTimeHeight");
  return result;
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)-[EKDayViewContent traitCollection](self->_content, "traitCollection");
}

- (EKEvent)occurrence
{
  return -[EKDayViewContentItem event](self->_item, "event");
}

- (BOOL)isProposedTime
{
  return -[EKDayViewContentItem isProposedTime](self->_item, "isProposedTime");
}

- (int64_t)birthdayCount
{
  return 0;
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[EKDayViewContentItem view](self->_item, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selected");

  return v3;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[EKDayViewContent traitCollection](self->_content, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (BOOL)isDimmed
{
  void *v4;
  void *v5;
  char v6;

  if (-[EKDayViewContentItem isProposedTime](self->_item, "isProposedTime"))
    return 1;
  -[EKDayViewContentItem event](self->_item, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewContent dimmedOccurrence](self->_content, "dimmedOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

+ (id)wrapperWithContentItem:(id)a3 viewContent:(id)a4
{
  id v5;
  id v6;
  EKDayViewContentItemStateWrapper *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[EKDayViewContentItemStateWrapper initWithContentItem:viewContent:]([EKDayViewContentItemStateWrapper alloc], "initWithContentItem:viewContent:", v6, v5);

  return v7;
}

- (EKDayViewContentItemStateWrapper)initWithContentItem:(id)a3 viewContent:(id)a4
{
  id v7;
  id v8;
  EKDayViewContentItemStateWrapper *v9;
  EKDayViewContentItemStateWrapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKDayViewContentItemStateWrapper;
  v9 = -[EKDayViewContentItemStateWrapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_content, a4);
  }

  return v10;
}

- (int64_t)horizontalSizeClass
{
  void *v2;
  int64_t v3;

  -[EKDayViewContent traitCollection](self->_content, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (NSArray)occurrences
{
  return -[EKDayViewContentItem events](self->_item, "events");
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return -[EKDayViewContentItem occurrenceIsFirstVisibleDayOfEvent](self->_item, "occurrenceIsFirstVisibleDayOfEvent");
}

- (BOOL)isMiniPreviewInEventDetail
{
  return -[EKDayViewContent isMiniPreviewInEventDetail](self->_content, "isMiniPreviewInEventDetail");
}

- (NSNumber)allDayOverride
{
  return (NSNumber *)MEMORY[0x1E0C9AAA0];
}

@end
