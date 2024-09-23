@implementation JFXCachedAnimojiImage

- (JFXCachedAnimojiImage)initWithMediaTimeRange:(id *)a3 animojiRenderingAttributes:(id)a4 animojiImageBuffer:(id)a5
{
  id v9;
  id v10;
  char *v11;
  JFXCachedAnimojiImage *v12;
  __int128 v13;
  __int128 v14;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)JFXCachedAnimojiImage;
  v11 = -[JFXCachedAnimojiImage init](&v16, sel_init);
  v12 = (JFXCachedAnimojiImage *)v11;
  if (v11)
  {
    v13 = *(_OWORD *)&a3->var0.var0;
    v14 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v11 + 56) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v11 + 40) = v14;
    *(_OWORD *)(v11 + 24) = v13;
    objc_storeStrong((id *)v11 + 2, a4);
    objc_storeStrong((id *)&v12->_animojiImageBuffer, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  Float64 Seconds;
  Float64 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  CMTimeRange range;
  CMTime v14;
  CMTime v15;
  CMTime time;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[JFXCachedAnimojiImage animojiImageBuffer](self, "animojiImageBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCachedAnimojiImage mediaTimeRange](self, "mediaTimeRange");
  time = v15;
  Seconds = CMTimeGetSeconds(&time);
  -[JFXCachedAnimojiImage mediaTimeRange](self, "mediaTimeRange");
  CMTimeRangeGetEnd(&v14, &range);
  v6 = CMTimeGetSeconds(&v14);
  -[JFXCachedAnimojiImage animojiRenderAttributes](self, "animojiRenderAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("imageBuffer %@ mediaRange %f:%f animojiRenderingAttributes %@"), v4, *(_QWORD *)&Seconds, *(_QWORD *)&v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)JFXCachedAnimojiImage;
  -[JFXCachedAnimojiImage description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PVImageBuffer)animojiImageBuffer
{
  return self->_animojiImageBuffer;
}

- (NSDictionary)animojiRenderAttributes
{
  return self->_animojiRenderAttributes;
}

- ($70930193D4F448A53BB9343C0237EB5F)mediaTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiRenderAttributes, 0);
  objc_storeStrong((id *)&self->_animojiImageBuffer, 0);
}

@end
