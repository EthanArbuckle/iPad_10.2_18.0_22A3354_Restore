@implementation GKHybridStrategist

- (GKGameModel)gameModel
{
  id *hybridStrategist;

  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
    return (GKGameModel *)hybridStrategist[7];
  else
    return (GKGameModel *)0;
}

- (void)setGameModel:(id)a3
{
  id v4;
  void *v5;
  _QWORD *hybridStrategist;
  BOOL v7;
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
  {
    v11 = v4;
    if (!v4)
    {
      v10 = (void *)hybridStrategist[7];
      hybridStrategist[7] = 0;
      goto LABEL_6;
    }
    v7 = -[GKHybridStrategist validateGameModel:](self, "validateGameModel:", v4);
    v5 = v11;
    if (v7)
    {
      v8 = self->_hybridStrategist;
      v9 = v11;
      v10 = (void *)v8[7];
      v8[7] = v9;
LABEL_6:

      v5 = v11;
    }
  }

}

- (GKRandom)randomSource
{
  id *hybridStrategist;

  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
    return (GKRandom *)hybridStrategist[8];
  else
    return (GKRandom *)0;
}

- (void)setRandomSource:(id)a3
{
  id v5;
  id *hybridStrategist;
  id v7;

  v5 = a3;
  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
  {
    v7 = v5;
    objc_storeStrong(hybridStrategist + 8, a3);
    v5 = v7;
  }

}

- (unint64_t)budget
{
  _QWORD *hybridStrategist;

  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
    return hybridStrategist[9];
  else
    return 0;
}

- (void)setBudget:(unint64_t)a3
{
  _QWORD *hybridStrategist;

  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
    hybridStrategist[9] = a3;
}

- (unint64_t)explorationParameter
{
  _QWORD *hybridStrategist;

  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
    return hybridStrategist[10];
  else
    return 0;
}

- (void)setExplorationParameter:(unint64_t)a3
{
  _QWORD *hybridStrategist;

  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
    hybridStrategist[10] = a3;
}

- (unint64_t)maxLookAheadDepth
{
  _QWORD *hybridStrategist;

  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
    return hybridStrategist[11];
  else
    return 0;
}

- (void)setMaxLookAheadDepth:(unint64_t)a3
{
  _QWORD *hybridStrategist;

  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
    hybridStrategist[11] = a3;
}

- (GKHybridStrategist)init
{
  GKHybridStrategist *v2;
  GKCHybridStrategist *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKHybridStrategist;
  v2 = -[GKHybridStrategist init](&v5, sel_init);
  if (v2)
  {
    v3 = (GKCHybridStrategist *)operator new();
    GKCHybridStrategist::GKCHybridStrategist(v3);
    v2->_hybridStrategist = v3;
  }
  return v2;
}

- (void)dealloc
{
  id *hybridStrategist;
  objc_super v4;

  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
  {
    GKCHybridStrategist::~GKCHybridStrategist(hybridStrategist);
    MEMORY[0x22E2A50A0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)GKHybridStrategist;
  -[GKHybridStrategist dealloc](&v4, sel_dealloc);
}

- (BOOL)validateGameModel:(id)a3
{
  id v3;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("No game model set for GKMonteCarloStrategist; game model must be set before attempting to find a move"),
      0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ must implement isWinForPlayer to work with GKMonteCarloStrategist"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }

  return 1;
}

- (BOOL)validateRandomSource
{
  void *v2;
  id v4;

  -[GKHybridStrategist randomSource](self, "randomSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("No random source set for GKMonteCarloStrategist; random source must be set before attempting to find a move"),
      0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 1;
}

- (id)bestMoveForActivePlayer
{
  void *v3;
  BOOL v4;

  if (!self->_hybridStrategist)
    return 0;
  -[GKHybridStrategist gameModel](self, "gameModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[GKHybridStrategist validateGameModel:](self, "validateGameModel:", v3))
  {

    return 0;
  }
  v4 = -[GKHybridStrategist validateRandomSource](self, "validateRandomSource");

  if (!v4)
    return 0;
  GKCHybridStrategist::bestMoveForActivePlayer((GKCHybridStrategist *)self->_hybridStrategist);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
