@implementation GKTerraceNoiseModifier

- (GKTerraceNoiseModifier)init
{
  return -[GKTerraceNoiseModifier initWithPeakInputValues:terracesInverted:](self, "initWithPeakInputValues:terracesInverted:", &unk_24F059360, 0);
}

- (GKTerraceNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKTerraceNoiseModifier initWithPeakInputValues:terracesInverted:](self, "initWithPeakInputValues:terracesInverted:", &unk_24F059378, 0);
}

- (GKTerraceNoiseModifier)initWithPeakInputValues:(id)a3 terracesInverted:(BOOL)a4
{
  id v6;
  GKTerraceNoiseModifier *v7;
  int v8;
  uint64_t v9;
  void *v10;
  double v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKTerraceNoiseModifier;
  v7 = -[GKNoiseModifier initWithInputModuleCount:](&v13, sel_initWithInputModuleCount_, 1);
  if (v7)
  {
    v8 = objc_msgSend(v6, "count");
    v7->_count = v8;
    v7->_inverted = a4;
    v7->_controlPoints = (double *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
    if (v7->_count >= 1)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v7->_controlPoints[v9] = v11;

        ++v9;
      }
      while (v9 < v7->_count);
    }
  }

  return v7;
}

- (void)dealloc
{
  double *controlPoints;
  objc_super v4;

  controlPoints = self->_controlPoints;
  if (controlPoints)
    free(controlPoints);
  v4.receiver = self;
  v4.super_class = (Class)GKTerraceNoiseModifier;
  -[GKTerraceNoiseModifier dealloc](&v4, sel_dealloc);
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKTerraceNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  double v5;
  double v6;
  uint64_t count;
  double result;
  double *controlPoints;
  uint64_t v10;
  int v11;
  unsigned int v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];

  v16 = v2[1];
  v17 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  v18[1] = v16;
  objc_msgSend(v4, "valueAt:", v18);
  v6 = v5;

  count = self->_count;
  if (!(_DWORD)count)
    return v6;
  if ((_DWORD)count == 1)
    return *self->_controlPoints;
  controlPoints = self->_controlPoints;
  result = *controlPoints;
  if (v6 > *controlPoints)
  {
    result = controlPoints[(int)count - 1];
    if (v6 < result)
    {
      v10 = 1;
      if ((int)count >= 2)
      {
        while (v6 >= controlPoints[v10])
        {
          if (count == ++v10)
          {
            LODWORD(v10) = self->_count;
            break;
          }
        }
      }
      if ((int)count > (int)v10 + 1)
        v11 = v10 + 1;
      else
        v11 = count - 1;
      v12 = v11 & ~(v11 >> 31);
      if ((_DWORD)v10 == v12)
      {
        return controlPoints[v10];
      }
      else
      {
        v13 = controlPoints[v10];
        v14 = v6 - v13;
        if (self->_inverted)
          v15 = controlPoints[v12];
        else
          v15 = controlPoints[v10];
        if (self->_inverted)
          v14 = 1.0 - (v6 - v13);
        else
          v13 = controlPoints[v12];
        return v15 * v15 + (v13 - v15 * v15) * v14;
      }
    }
  }
  return result;
}

- (id)cloneModule
{
  id v3;
  uint64_t v4;
  void *v5;
  GKTerraceNoiseModifier *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_count >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", self->_controlPoints[v4]);
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < self->_count);
  }
  v6 = -[GKTerraceNoiseModifier initWithPeakInputValues:terracesInverted:]([GKTerraceNoiseModifier alloc], "initWithPeakInputValues:terracesInverted:", v3, self->_inverted);

  return v6;
}

@end
