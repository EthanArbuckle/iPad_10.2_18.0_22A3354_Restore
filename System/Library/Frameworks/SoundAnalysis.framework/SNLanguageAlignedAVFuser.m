@implementation SNLanguageAlignedAVFuser

- (SNLanguageAlignedAVFuser)init
{
  sub_1D437F7C4();
}

- (SNLanguageAlignedAVFuser)initWithVisionEmbeddingVersion:(int64_t)a3 audioEmbeddingVersion:(int64_t)a4 error:(id *)a5
{
  return (SNLanguageAlignedAVFuser *)sub_1D437F828(a3, a4);
}

- (id)fuseVisionEmbedding:(id)a3 audioEmbedding:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  SNLanguageAlignedAVFuser *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1D437F978(v7, (uint64_t)v8);

  return v10;
}

+ (BOOL)supportsFusionOfVisionEmbeddingVersion:(int64_t)a3 audioEmbeddingVersion:(int64_t)a4
{
  return sub_1D437FD58(a3, a4);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
