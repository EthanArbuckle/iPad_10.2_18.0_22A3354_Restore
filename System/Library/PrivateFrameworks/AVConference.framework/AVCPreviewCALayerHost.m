@implementation AVCPreviewCALayerHost

- (AVCPreviewCALayerHost)initWithPreview:(id)a3
{
  AVCPreviewCALayerHost *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AVCPreviewCALayerHost;
  v4 = -[CALayerHost init](&v6, sel_init);
  if (v4)
    v4->_preview = (VCWeakObjectHolder *)(id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCPreviewCALayerHost;
  -[CALayerHost dealloc](&v3, sel_dealloc);
}

- (void)layoutSublayers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d strong reference to AVConferencePreview is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
