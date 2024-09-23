@implementation GKMonteCarloStrategist

- (GKGameModel)gameModel
{
  GKCMonteCarloStrategist *monteCarloStrategist;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
    return (GKGameModel *)monteCarloStrategist->var0;
  else
    return (GKGameModel *)0;
}

- (void)setGameModel:(id)a3
{
  id v4;
  void *v5;
  GKCMonteCarloStrategist *monteCarloStrategist;
  BOOL v7;
  GKCMonteCarloStrategist *v8;
  id v9;
  id var0;
  void *v11;

  v4 = a3;
  v5 = v4;
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {
    v11 = v4;
    if (!v4)
    {
      var0 = monteCarloStrategist->var0;
      monteCarloStrategist->var0 = 0;
      goto LABEL_6;
    }
    v7 = -[GKMonteCarloStrategist validateGameModel:](self, "validateGameModel:", v4);
    v5 = v11;
    if (v7)
    {
      v8 = self->_monteCarloStrategist;
      v9 = v11;
      var0 = v8->var0;
      v8->var0 = v9;
LABEL_6:

      v5 = v11;
    }
  }

}

- (GKRandom)randomSource
{
  GKCMonteCarloStrategist *monteCarloStrategist;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
    return (GKRandom *)monteCarloStrategist->var1;
  else
    return (GKRandom *)0;
}

- (void)setRandomSource:(id)a3
{
  id v5;
  GKCMonteCarloStrategist *monteCarloStrategist;
  id v7;

  v5 = a3;
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {
    v7 = v5;
    objc_storeStrong(&monteCarloStrategist->var1, a3);
    v5 = v7;
  }

}

- (NSUInteger)budget
{
  GKCMonteCarloStrategist *monteCarloStrategist;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
    return monteCarloStrategist->var2;
  else
    return 0;
}

- (void)setBudget:(NSUInteger)budget
{
  GKCMonteCarloStrategist *monteCarloStrategist;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
    monteCarloStrategist->var2 = budget;
}

- (NSUInteger)explorationParameter
{
  GKCMonteCarloStrategist *monteCarloStrategist;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
    return monteCarloStrategist->var3;
  else
    return 0;
}

- (void)setExplorationParameter:(NSUInteger)explorationParameter
{
  GKCMonteCarloStrategist *monteCarloStrategist;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
    monteCarloStrategist->var3 = explorationParameter;
}

- (GKMonteCarloStrategist)init
{
  GKMonteCarloStrategist *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMonteCarloStrategist;
  v2 = -[GKMonteCarloStrategist init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = objc_alloc_init(GKARC4RandomSource);
    *(_OWORD *)(v3 + 16) = xmmword_227BC0030;
    *(_WORD *)(v3 + 32) = 0;
    v2->_monteCarloStrategist = (GKCMonteCarloStrategist *)v3;
  }
  return v2;
}

- (void)dealloc
{
  GKCMonteCarloStrategist *monteCarloStrategist;
  objc_super v4;

  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {

    MEMORY[0x22E2A50A0](monteCarloStrategist, 0x1080C4018622206);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKMonteCarloStrategist;
  -[GKMonteCarloStrategist dealloc](&v4, sel_dealloc);
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

- (id)bestMoveForActivePlayer
{
  void *v3;
  BOOL v4;
  void *v5;
  GKARC4RandomSource *v6;

  if (!self->_monteCarloStrategist)
    return 0;
  -[GKMonteCarloStrategist gameModel](self, "gameModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKMonteCarloStrategist validateGameModel:](self, "validateGameModel:", v3);

  if (!v4)
    return 0;
  -[GKMonteCarloStrategist randomSource](self, "randomSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(GKARC4RandomSource);
    -[GKMonteCarloStrategist setRandomSource:](self, "setRandomSource:", v6);

  }
  GKCMonteCarloStrategist::bestMoveForActivePlayer(self->_monteCarloStrategist);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
