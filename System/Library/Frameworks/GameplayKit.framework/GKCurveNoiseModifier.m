@implementation GKCurveNoiseModifier

- (GKCurveNoiseModifier)init
{
  void *v3;
  GKCurveNoiseModifier *v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = &unk_24F0592B8;
  v6[1] = &unk_24F0592D8;
  v7[0] = &unk_24F0592B8;
  v7[1] = &unk_24F0592D8;
  v6[2] = &unk_24F0592E8;
  v6[3] = &unk_24F0592C8;
  v7[2] = &unk_24F0592E8;
  v7[3] = &unk_24F0592C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKCurveNoiseModifier initWithControlPoints:](self, "initWithControlPoints:", v3);

  return v4;
}

- (GKCurveNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  void *v4;
  GKCurveNoiseModifier *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v7[0] = &unk_24F0592B8;
  v7[1] = &unk_24F0592D8;
  v8[0] = &unk_24F0592B8;
  v8[1] = &unk_24F0592D8;
  v7[2] = &unk_24F0592E8;
  v7[3] = &unk_24F0592C8;
  v8[2] = &unk_24F0592E8;
  v8[3] = &unk_24F0592C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GKCurveNoiseModifier initWithControlPoints:](self, "initWithControlPoints:", v4);

  return v5;
}

- (GKCurveNoiseModifier)initWithControlPoints:(id)a3
{
  id v4;
  GKCurveNoiseModifier *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GKCurveNoiseModifier;
  v5 = -[GKNoiseModifier initWithInputModuleCount:](&v20, sel_initWithInputModuleCount_, 1);
  if (v5)
  {
    if (v4 && objc_msgSend(v4, "count"))
    {
      v6 = objc_msgSend(v4, "count");
      v5->_count = v6;
      v5->_controlPoints = (double *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v7, "valueForKey:", v11, (_QWORD)v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "doubleValue");
            *(_QWORD *)v5->_controlPoints = v13;
            objc_msgSend(v11, "doubleValue");
            *(_QWORD *)v5->_parameters = v14;

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v8);
      }

    }
    else
    {
      v5->_controlPoints = 0;
      v5->_count = 0;
    }
  }

  return v5;
}

- (void)dealloc
{
  double *controlPoints;
  double *parameters;
  objc_super v5;

  controlPoints = self->_controlPoints;
  if (controlPoints)
    free(controlPoints);
  parameters = self->_parameters;
  if (parameters)
    free(parameters);
  v5.receiver = self;
  v5.super_class = (Class)GKCurveNoiseModifier;
  -[GKCurveNoiseModifier dealloc](&v5, sel_dealloc);
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKCurveNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  double v5;
  double v6;
  uint64_t count;
  int v8;
  double *parameters;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double *controlPoints;
  int v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  double *v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];

  v30 = v2[1];
  v31 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v31;
  v32[1] = v30;
  objc_msgSend(v4, "valueAt:", v32);
  v6 = v5;

  count = self->_count;
  if (!(_DWORD)count)
    return v6;
  v8 = count - 1;
  if ((_DWORD)count == 1)
    return *self->_controlPoints;
  parameters = self->_parameters;
  v10 = *parameters;
  if (v6 <= *parameters)
    return *self->_controlPoints;
  v11 = (int)count;
  if (v6 >= parameters[v11 - 1])
    return self->_controlPoints[v11 - 1];
  if ((_DWORD)count == 2)
    return (self->_controlPoints[1] - *self->_controlPoints) * (v6 - v10) / (parameters[1] - v10)
         + *self->_controlPoints;
  if ((_DWORD)count == 3)
  {
    v21 = (v6 - v10) / (parameters[1] - v10);
    controlPoints = self->_controlPoints;
    return *controlPoints
         + (controlPoints[1]
          - *controlPoints
          + -(controlPoints[2] - controlPoints[1] - (controlPoints[2] - controlPoints[1]) * v21) * v21)
         * v21;
  }
  if ((_DWORD)count != 4)
  {
    v23 = count - 2;
    if ((int)count < 2)
    {
      LODWORD(v24) = 1;
    }
    else
    {
      v24 = 1;
      while (v6 >= self->_controlPoints[v24])
      {
        if (count == ++v24)
        {
          LODWORD(v24) = self->_count;
          break;
        }
      }
    }
    if (v8 >= (int)v24)
      v8 = v24;
    v25 = v8 & ~(v8 >> 31);
    if (v25 == (_DWORD)v24)
      return self->_controlPoints[v24];
    if ((int)count + 1 < (int)v24)
      v26 = count + 1;
    else
      v26 = v24;
    v27 = v26 & ~(v26 >> 31);
    if (v23 >= (int)v24)
      v23 = v24;
    v28 = v25;
    v14 = v6 - parameters[v28];
    v29 = self->_controlPoints;
    v16 = v29[v23 & ~(v23 >> 31)];
    v17 = v29[v28];
    v18 = v29[v24];
    v19 = v29[v27];
    return v17 + (v18 - v16 + (v16 - v17 - (v19 - (v18 + v16 - v17)) + (v19 - (v18 + v16 - v17)) * v14) * v14) * v14;
  }
  v12 = parameters[1];
  if (v6 <= v12)
    return self->_controlPoints[1];
  v13 = parameters[2];
  if (v6 < v13)
  {
    v14 = (v6 - v12) / (v13 - v12);
    v15 = self->_controlPoints;
    v16 = *v15;
    v17 = v15[1];
    v18 = v15[2];
    v19 = v15[3];
    return v17 + (v18 - v16 + (v16 - v17 - (v19 - (v18 + v16 - v17)) + (v19 - (v18 + v16 - v17)) * v14) * v14) * v14;
  }
  return self->_controlPoints[2];
}

- (id)cloneModule
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  GKCurveNoiseModifier *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_count >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", self->_controlPoints[v4]);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", self->_parameters[v4]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

      ++v4;
    }
    while (v4 < self->_count);
  }
  v7 = -[GKCurveNoiseModifier initWithControlPoints:]([GKCurveNoiseModifier alloc], "initWithControlPoints:", v3);

  return v7;
}

@end
