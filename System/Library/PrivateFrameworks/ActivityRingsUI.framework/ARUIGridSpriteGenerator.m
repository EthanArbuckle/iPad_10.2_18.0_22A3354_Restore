@implementation ARUIGridSpriteGenerator

- (id)generateSprites
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_spriteCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_spriteCount)
  {
    v4 = 0;
    do
    {
      -[ARUIGridSpriteGenerator spriteAtIndex:](self, "spriteAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < self->_spriteCount);
  }
  return v3;
}

- (id)spriteAtIndex:(unint64_t)a3
{
  ARUISprite *v5;
  unint64_t framesPerSprite;
  unint64_t columnsPerSprite;
  double v8;
  double v9;
  double v10;

  v5 = [ARUISprite alloc];
  framesPerSprite = self->_framesPerSprite;
  columnsPerSprite = self->_columnsPerSprite;
  -[ARUIGridSpriteGenerator originForSpriteAtIndex:](self, "originForSpriteAtIndex:", a3);
  v9 = v8;
  -[ARUIGridSpriteGenerator frameSize](self, "frameSize");
  return -[ARUISprite initWithFrameCount:frameColumns:firstFrameOrigin:frameSize:](v5, "initWithFrameCount:frameColumns:firstFrameOrigin:frameSize:", framesPerSprite, columnsPerSprite, v9, v10);
}

- (__n64)originForSpriteAtIndex:(unint64_t)a3
{
  __n64 result;

  result.n64_u32[0] = 0;
  result.n64_f32[1] = (float)a3 / (float)*(unint64_t *)(a1 + 8);
  return result;
}

- (float32x2_t)frameSize
{
  uint64x2_t v1;

  v1.i64[0] = a1[3];
  v1.i64[1] = a1[4] * a1[1];
  __asm { FMOV            V1.2D, #1.0 }
  return vcvt_f32_f64(vdivq_f64(_Q1, vcvtq_f64_u64(v1)));
}

+ (id)generatorWithSpriteCount:(unint64_t)a3 framesPerSprite:(unint64_t)a4 rowsPerSprite:(unint64_t)a5 columnsPerSprite:(unint64_t)a6
{
  return -[ARUIGridSpriteGenerator initWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:]([ARUIGridSpriteGenerator alloc], "initWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", a3, a4, a5, a6);
}

- (ARUIGridSpriteGenerator)initWithSpriteCount:(unint64_t)a3 framesPerSprite:(unint64_t)a4 rowsPerSprite:(unint64_t)a5 columnsPerSprite:(unint64_t)a6
{
  ARUIGridSpriteGenerator *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARUIGridSpriteGenerator;
  result = -[ARUIGridSpriteGenerator init](&v11, sel_init);
  if (result)
  {
    result->_spriteCount = a3;
    result->_framesPerSprite = a4;
    result->_columnsPerSprite = a6;
    result->_rowsPerSprite = a5;
  }
  return result;
}

@end
