@implementation _ATXScoreInterpreterCtx

- (_ATXScoreInterpreterCtx)initWithInputScores:(id)a3 intentType:(id)a4
{
  id v7;
  id v8;
  _ATXScoreInterpreterCtx *v9;
  _ATXScoreInterpreterCtx *v10;
  uint64_t v11;
  ATXScoreDict *subscores;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ATXScoreInterpreterCtx;
  v9 = -[_ATXScoreInterpreterCtx init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->inputScores, a3);
    objc_storeStrong((id *)&v10->intentType, a4);
    v11 = objc_opt_new();
    subscores = v10->subscores;
    v10->subscores = (ATXScoreDict *)v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->intentType, 0);
  objc_storeStrong((id *)&self->subscores, 0);
  objc_storeStrong((id *)&self->inputScores, 0);
}

@end
