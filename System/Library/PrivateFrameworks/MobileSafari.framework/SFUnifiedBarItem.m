@implementation SFUnifiedBarItem

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setViewReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SFUnifiedBarItemView)reusableView
{
  return self->_reusableView;
}

- (void)setActiveAnimationCount:(int64_t)a3
{
  self->_activeAnimationCount = a3;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    -[SFUnifiedBarItemView setHidden:](self->_reusableView, "setHidden:");
  }
}

- (BOOL)isDragging
{
  return 0;
}

- (BOOL)isDropping
{
  return 0;
}

- (SFUnifiedBarItem)secondaryItem
{
  return 0;
}

- (SFUnifiedBarItemView)view
{
  return 0;
}

- (void)setReusableView:(id)a3
{
  objc_storeStrong((id *)&self->_reusableView, a3);
}

- (id)menuElementRepresentationWithSelectionHandler:(id)a3
{
  return 0;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (unint64_t)spacingOptions
{
  return self->_spacingOptions;
}

- (void)setSpacingOptions:(unint64_t)a3
{
  self->_spacingOptions = a3;
}

- (BOOL)hasOverlayConfiguration
{
  return self->_hasOverlayConfiguration;
}

- (SFUnifiedBarItemView)reusablePreviewView
{
  return self->_reusablePreviewView;
}

- (void)setReusablePreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_reusablePreviewView, a3);
}

- (NSString)viewReuseIdentifier
{
  return self->_viewReuseIdentifier;
}

- (int64_t)activeAnimationCount
{
  return self->_activeAnimationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_reusablePreviewView, 0);
  objc_storeStrong((id *)&self->_reusableView, 0);
}

@end
