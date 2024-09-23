@implementation TDEffectComponent

- (void)setEffectParametersFromPreset:(id)a3 atIndex:(unint64_t)a4 withDocument:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t i;
  unsigned int v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  unint64_t v20;
  uint64_t v21;

  v9 = objc_msgSend(a5, "effectTypeWithIdentifier:", objc_msgSend(a3, "effectTypeAtIndex:", a4));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 5);
  -[TDEffectComponent setEffectType:](self, "setEffectType:", v9);
  v20 = 0;
  v21 = 0;
  objc_msgSend(a3, "getEffectTuples:count:atEffectIndex:", &v21, &v20, a4);
  if (v20)
  {
    v11 = 0;
    for (i = 0; i < v20; ++i)
    {
      v13 = *(_DWORD *)(v21 + v11 + 4);
      v14 = *(double *)(v21 + v11 + 8);
      v15 = objc_msgSend(a5, "effectParameterTypeWithIdentifier:", v13);
      v16 = (void *)objc_msgSend(a5, "newObjectForEntity:", CFSTR("EffectParameterValue"));
      objc_msgSend(v16, "setParameterType:", v15);
      objc_msgSend(v16, "setComponent:", self);
      switch(v13)
      {
        case 0u:
        case 1u:
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *(_QWORD *)&v14);
          objc_msgSend(v16, "setColorValue:", v17);
          goto LABEL_8;
        case 2u:
        case 3u:
          v18 = objc_alloc(MEMORY[0x24BDD16E0]);
          *(float *)&v19 = v14;
          v17 = (void *)objc_msgSend(v18, "initWithFloat:", v19);
          objc_msgSend(v16, "setFloatValue:", v17);
          goto LABEL_8;
        case 4u:
        case 5u:
        case 7u:
        case 8u:
        case 9u:
        case 0xAu:
        case 0xBu:
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *(_QWORD *)&v14);
          objc_msgSend(v16, "setIntValue:", v17);
          goto LABEL_8;
        case 6u:
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithShort:", SLOWORD(v14));
          objc_msgSend(v16, "setAngleValue:", v17);
LABEL_8:

          break;
        default:
          break;
      }
      objc_msgSend(v10, "addObject:", v16);

      v11 += 16;
    }
  }
  -[TDEffectComponent setParameters:](self, "setParameters:", v10);

}

- (void)updatePresetParameters:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  float v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)-[TDEffectComponent effectType](self, "effectType"), "identifier");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)-[TDEffectComponent parameters](self, "parameters", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = objc_msgSend((id)objc_msgSend(v13, "parameterType"), "identifier");
        switch((int)v14)
        {
          case 0:
          case 1:
            v15 = (void *)objc_msgSend(v13, "colorValue");
            goto LABEL_9;
          case 2:
          case 3:
            objc_msgSend((id)objc_msgSend(v13, "floatValue"), "floatValue");
            v16 = v17;
            break;
          case 4:
          case 5:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
            v15 = (void *)objc_msgSend(v13, "intValue");
LABEL_9:
            v16 = COERCE_DOUBLE(objc_msgSend(v15, "unsignedIntegerValue"));
            break;
          case 6:
            *(_QWORD *)&v16 = (unsigned __int16)objc_msgSend((id)objc_msgSend(v13, "angleValue"), "shortValue");
            break;
          default:
            v16 = 0.0;
            break;
        }
        objc_msgSend(a3, "addValue:forParameter:withEffectType:atEffectIndex:", *(_QWORD *)&v16, v14, v7, a4);
        ++v12;
      }
      while (v10 != v12);
      v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v10 = v18;
    }
    while (v18);
  }
}

- (void)addParametersToPreset:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  float v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)-[TDEffectComponent effectType](self, "effectType"), "identifier");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)-[TDEffectComponent parameters](self, "parameters", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_msgSend((id)objc_msgSend(v11, "parameterType"), "identifier");
        switch((int)v12)
        {
          case 0:
          case 1:
            v13 = (void *)objc_msgSend(v11, "colorValue");
            goto LABEL_9;
          case 2:
          case 3:
            objc_msgSend((id)objc_msgSend(v11, "floatValue"), "floatValue");
            v14 = v15;
            break;
          case 4:
          case 5:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
            v13 = (void *)objc_msgSend(v11, "intValue");
LABEL_9:
            v14 = COERCE_DOUBLE(objc_msgSend(v13, "unsignedIntegerValue"));
            break;
          case 6:
            *(_QWORD *)&v14 = (unsigned __int16)objc_msgSend((id)objc_msgSend(v11, "angleValue"), "shortValue");
            break;
          default:
            v14 = 0.0;
            break;
        }
        objc_msgSend(a3, "appendValue:forParameter:withEffectType:", *(_QWORD *)&v14, v12, v5);
        ++v10;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v16;
    }
    while (v16);
  }
}

- (id)parameterOfType:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[TDEffectComponent parameters](self, "parameters");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "parameterType"), "identifier") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterColor1
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterColor1
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 0);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterColor2
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterColor2
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 1);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterOpacity
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterOpacity
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 2);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterOpacity2
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterOpacity2
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 3);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterBlurSize
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterBlurSize
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 4);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterOffset
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterOffset
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 5);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterAngle
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterAngle
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 6);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterBlendMode
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterBlendMode
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 7);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterSoftenSize
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterSoftenSize
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 8);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterSpread
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterSpread
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 9);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterTintable
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterTintable
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 10);
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterBevelStyle
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("parameters"), 0);
}

- (id)CUIEffectParameterBevelStyle
{
  return -[TDEffectComponent parameterOfType:](self, "parameterOfType:", 11);
}

@end
