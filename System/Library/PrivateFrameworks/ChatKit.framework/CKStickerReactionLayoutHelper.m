@implementation CKStickerReactionLayoutHelper

+ (CGPoint)stickerCenterForIndex:(int64_t)a3 inFrame:(CGRect)a4 alignLeft:(BOOL)a5 stickerSize:(CGSize)a6
{
  double v6;
  double v7;
  CGPoint result;

  _s7ChatKit27StickerReactionLayoutHelperC13stickerCenter3for2in9alignLeft0G4SizeSo7CGPointVSi_So6CGRectVSbSo6CGSizeVtFZ_0(a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6.width, a6.height);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CKStickerReactionLayoutHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickerReactionLayoutHelper();
  return -[CKStickerReactionLayoutHelper init](&v3, sel_init);
}

@end
