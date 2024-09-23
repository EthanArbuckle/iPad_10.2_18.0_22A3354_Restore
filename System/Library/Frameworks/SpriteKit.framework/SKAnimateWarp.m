@implementation SKAnimateWarp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKAnimateWarp)init
{
  SKAnimateWarp *v2;
  uint64_t v3;
  const SKCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKAnimateWarp;
  v2 = -[SKAction init](&v8, sel_init);
  if (v2)
  {
    v3 = operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SKAnimateWarp;
    v4 = -[SKAction caction](&v7, sel_caction);
    SKCAction::SKCAction((SKCAction *)v3, v4);
    *(_QWORD *)v3 = &off_1EA4FEB08;
    *(_QWORD *)(v3 + 120) = 0;
    *(_QWORD *)(v3 + 128) = 0;
    *(_QWORD *)(v3 + 112) = 0;
    v2->_mycaction = (SKCAnimateMesh *)v3;
    *(_BYTE *)(v3 + 136) = 1;
    v6.receiver = v2;
    v6.super_class = (Class)SKAnimateWarp;
    -[SKAction setCppAction:](&v6, sel_setCppAction_, v3);
  }
  return v2;
}

+ (id)warpTo:(id)a3 duration:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAnimateWarp animateWithWarps:times:](SKAnimateWarp, "animateWithWarps:times:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)animateWithWarps:(id)a3 times:(id)a4
{
  +[SKAnimateWarp animateWithWarps:times:restore:](SKAnimateWarp, "animateWithWarps:times:restore:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)animateWithWarps:(id)a3 times:(id)a4 restore:(BOOL)a5
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  float v26;
  SKAnimateWarp *v27;
  uint64_t v28;
  SKCAnimateMesh *mycaction;
  id var20;
  float v31;
  BOOL v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 >= 1 && (v10 = objc_msgSend(v8, "count"), v10 == v9))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = a5;
      v12 = v11;
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = v7;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction: 'warps' must be of type SKWarpGeometryGrid"));
              goto LABEL_29;
            }
            v18 = v17;
            v19 = objc_msgSend(v18, "numberOfRows");
            if (v19 != objc_msgSend(v12, "numberOfRows")
              || (v20 = objc_msgSend(v18, "numberOfColumns"), v20 != objc_msgSend(v12, "numberOfColumns")))
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction: 'warps' must all have the same number of rows and columns"));

LABEL_29:
              v27 = 0;
              goto LABEL_30;
            }
            v21 = (void *)objc_msgSend(v18, "copy");
            objc_msgSend(obj, "addObject:", v21);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v14)
            continue;
          break;
        }
      }

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v13 = v8;
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v37;
        while (2)
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v13);
            v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "floatValue");
              if (v26 >= 0.0)
                continue;
            }
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction: 'times' must all be increasing floating point values"));
            goto LABEL_29;
          }
          v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v22)
            continue;
          break;
        }
      }

      v27 = objc_alloc_init(SKAnimateWarp);
      objc_storeStrong(&v27->_mycaction->var19, obj);
      v28 = objc_msgSend(v13, "copy");
      mycaction = v27->_mycaction;
      var20 = mycaction->var20;
      mycaction->var20 = (id)v28;

      v27->_mycaction->var22 = v33;
      objc_msgSend(v13, "lastObject");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      -[SKAction setDuration:](v27, "setDuration:", v31);
LABEL_30:

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction: 'warps' must be of type SKWarpGeometryGrid"));
      v27 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction: 'warps' and 'times' arrays must have non-zero and equal counts"));
    v27 = 0;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKAnimateWarp;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_mycaction->var22, CFSTR("_restore"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mycaction->var19, CFSTR("_grids"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mycaction->var20, CFSTR("_times"));

}

- (SKAnimateWarp)initWithCoder:(id)a3
{
  id v4;
  SKAnimateWarp *v5;
  uint64_t v6;
  const SKCAction *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SKCAnimateMesh *mycaction;
  id var19;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SKCAnimateMesh *v18;
  id var20;
  objc_super v21;
  objc_super v22;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SKAnimateWarp;
  v5 = -[SKAction initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = operator new();
    v22.receiver = v5;
    v22.super_class = (Class)SKAnimateWarp;
    v7 = -[SKAction caction](&v22, sel_caction);
    SKCAction::SKCAction((SKCAction *)v6, v7);
    *(_QWORD *)v6 = &off_1EA4FEB08;
    *(_QWORD *)(v6 + 120) = 0;
    *(_QWORD *)(v6 + 128) = 0;
    *(_QWORD *)(v6 + 112) = 0;
    v5->_mycaction = (SKCAnimateMesh *)v6;
    *(_BYTE *)(v6 + 136) = 1;
    v21.receiver = v5;
    v21.super_class = (Class)SKAnimateWarp;
    -[SKAction setCppAction:](&v21, sel_setCppAction_, v6);
    v5->_mycaction->var22 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_restore"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_grids"));
    v11 = objc_claimAutoreleasedReturnValue();
    mycaction = v5->_mycaction;
    var19 = mycaction->var19;
    mycaction->var19 = (id)v11;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_times"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v5->_mycaction;
    var20 = v18->var20;
    v18->var20 = (id)v17;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKAnimateWarp;
  v4 = -[SKAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong((id *)(v4[2] + 120), self->_mycaction->var20);
  objc_storeStrong((id *)(v4[2] + 112), self->_mycaction->var19);
  *(_BYTE *)(v4[2] + 136) = self->_mycaction->var22;
  return v4;
}

@end
