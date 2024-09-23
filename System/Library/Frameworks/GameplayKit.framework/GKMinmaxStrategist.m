@implementation GKMinmaxStrategist

- (NSInteger)maxLookAheadDepth
{
  _QWORD *cppMinmax;

  cppMinmax = self->_cppMinmax;
  if (cppMinmax)
    return cppMinmax[12];
  else
    return 0;
}

- (void)setMaxLookAheadDepth:(NSInteger)maxLookAheadDepth
{
  _QWORD *cppMinmax;

  cppMinmax = self->_cppMinmax;
  if (cppMinmax)
    cppMinmax[12] = maxLookAheadDepth;
}

- (GKGameModel)gameModel
{
  id *cppMinmax;

  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
    return (GKGameModel *)cppMinmax[9];
  else
    return (GKGameModel *)0;
}

- (void)setGameModel:(id)a3
{
  id v5;
  id *cppMinmax;
  id v7;

  v5 = a3;
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    v7 = v5;
    objc_storeStrong(cppMinmax + 9, a3);
    v5 = v7;
  }

}

- (GKRandom)randomSource
{
  id *cppMinmax;

  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
    return (GKRandom *)cppMinmax[11];
  else
    return (GKRandom *)0;
}

- (void)setRandomSource:(id)a3
{
  id v5;
  id *cppMinmax;
  id v7;

  v5 = a3;
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    v7 = v5;
    objc_storeStrong(cppMinmax + 11, a3);
    v5 = v7;
  }

}

- (GKMinmaxStrategist)init
{
  GKMinmaxStrategist *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMinmaxStrategist;
  v2 = -[GKMinmaxStrategist init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = v3 + 24;
    *(_QWORD *)(v3 + 32) = v3 + 24;
    *(_OWORD *)(v3 + 72) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 40) = 0u;
    *(int64x2_t *)(v3 + 96) = vdupq_n_s64(1uLL);
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_QWORD *)(v3 + 144) = 0;
    *(_OWORD *)(v3 + 152) = xmmword_227BBFFE0;
    *(_OWORD *)(v3 + 168) = xmmword_227BBFFF0;
    *(_WORD *)(v3 + 184) = 0;
    *(_BYTE *)(v3 + 186) = 0;
    *(_QWORD *)(v3 + 88) = 0;
    v2->_cppMinmax = (void *)v3;
  }
  return v2;
}

- (void)dealloc
{
  id *cppMinmax;
  objc_super v4;

  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    GKCMinmaxStrategist::~GKCMinmaxStrategist(cppMinmax);
    MEMORY[0x22E2A50A0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)GKMinmaxStrategist;
  -[GKMinmaxStrategist dealloc](&v4, sel_dealloc);
}

- (id)bestMoveForActivePlayer
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *cppMinmax;
  void *v10;

  if (self->_cppMinmax)
  {
    -[GKMinmaxStrategist gameModel](self, "gameModel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[GKMinmaxStrategist gameModel](self, "gameModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activePlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v10 = 0;
        goto LABEL_9;
      }
      -[GKMinmaxStrategist gameModel](self, "gameModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        cppMinmax = self->_cppMinmax;
        -[GKMinmaxStrategist gameModel](self, "gameModel");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "activePlayer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        GKCMinmaxStrategist::findBestMoveForPlayer((uint64_t)cppMinmax, v5, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        return v10;
      }
    }
  }
  return 0;
}

- (id)bestMoveForPlayer:(id)player
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = player;
  if (!self->_cppMinmax)
    goto LABEL_5;
  -[GKMinmaxStrategist gameModel](self, "gameModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[GKMinmaxStrategist gameModel](self, "gameModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      GKCMinmaxStrategist::findBestMoveForPlayer((uint64_t)self->_cppMinmax, v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v5 = 0;
  }
LABEL_6:

  return v5;
}

- (id)randomMoveForPlayer:(id)player fromNumberOfBestMoves:(NSInteger)numMovesToConsider
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD *cppMinmax;
  void *v11;

  v6 = player;
  if (self->_cppMinmax
    && (-[GKMinmaxStrategist gameModel](self, "gameModel"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (-[GKMinmaxStrategist gameModel](self, "gameModel"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    cppMinmax = self->_cppMinmax;
    cppMinmax[13] = numMovesToConsider;
    GKCMinmaxStrategist::findBestMoveForPlayer((uint64_t)cppMinmax, v6, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
