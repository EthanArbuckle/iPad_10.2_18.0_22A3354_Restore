@implementation PKMetalRenderMaskRenderCache

- (PKMetalRenderMaskRenderCache)initWithInk:(id)a3 strokeDataUUID:(id)a4
{
  id v7;
  PKMetalRenderMaskRenderCache *v8;
  PKMetalRenderMaskRenderCache *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKMetalRenderMaskRenderCache;
  v8 = -[PKMetalStrokeRenderCache initWithInk:renderZoomFactor:](&v11, sel_initWithInk_renderZoomFactor_, a3, 1);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_strokeDataUUID, a4);

  return v9;
}

- (NSUUID)strokeDataUUID
{
  return self->_strokeDataUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeDataUUID, 0);
}

@end
