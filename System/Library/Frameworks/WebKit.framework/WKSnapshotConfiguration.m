@implementation WKSnapshotConfiguration

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKSnapshotConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKSnapshotConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (WKSnapshotConfiguration)init
{
  WKSnapshotConfiguration *v2;
  WKSnapshotConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKSnapshotConfiguration;
  v2 = -[WKSnapshotConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WKSnapshotConfiguration setRect:](v2, "setRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[WKSnapshotConfiguration setAfterScreenUpdates:](v3, "setAfterScreenUpdates:", 1);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKSnapshotConfiguration;
  -[WKSnapshotConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[WKSnapshotConfiguration rect](self, "rect");
  objc_msgSend(v4, "setRect:");
  objc_msgSend(v4, "setSnapshotWidth:", -[WKSnapshotConfiguration snapshotWidth](self, "snapshotWidth"));
  objc_msgSend(v4, "setAfterScreenUpdates:", -[WKSnapshotConfiguration afterScreenUpdates](self, "afterScreenUpdates"));
  objc_msgSend(v4, "_setUsesTransparentBackground:", -[WKSnapshotConfiguration _usesTransparentBackground](self, "_usesTransparentBackground"));
  return v4;
}

- (BOOL)_usesTransparentBackground
{
  return self->_usesTransparentBackground;
}

- (void)_setUsesTransparentBackground:(BOOL)a3
{
  self->_usesTransparentBackground = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)rect
{
  self->_rect = rect;
}

- (NSNumber)snapshotWidth
{
  return self->_snapshotWidth;
}

- (void)setSnapshotWidth:(NSNumber *)snapshotWidth
{
  objc_setProperty_nonatomic_copy(self, a2, snapshotWidth, 16);
}

- (BOOL)afterScreenUpdates
{
  return self->_afterScreenUpdates;
}

- (void)setAfterScreenUpdates:(BOOL)afterScreenUpdates
{
  self->_afterScreenUpdates = afterScreenUpdates;
}

@end
