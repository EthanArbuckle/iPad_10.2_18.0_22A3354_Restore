@implementation VCPMovieHighlightResult

- (VCPMovieHighlightResult)initWithTimeRange:(id *)a3 score:(float)a4 andKeyFrame:(id)a5
{
  id v9;
  char *v10;
  VCPMovieHighlightResult *v11;
  __int128 v12;
  __int128 v13;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMovieHighlightResult;
  v10 = -[VCPMovieHighlightResult init](&v15, sel_init);
  v11 = (VCPMovieHighlightResult *)v10;
  if (v10)
  {
    v12 = *(_OWORD *)&a3->var0.var0;
    v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v10 + 56) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v10 + 40) = v13;
    *(_OWORD *)(v10 + 24) = v12;
    *((float *)v10 + 2) = a4;
    objc_storeStrong((id *)v10 + 2, a5);
  }

  return v11;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timerange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (float)score
{
  return self->_score;
}

- (VCPVideoKeyFrameResult)keyFrame
{
  return self->_keyFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFrame, 0);
}

@end
