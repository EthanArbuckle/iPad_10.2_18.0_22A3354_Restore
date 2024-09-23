@implementation MRUVolumeGroupCoordinator

- (MRUVolumeGroupCoordinator)initWithMainVolumeController:(id)a3
{
  id v5;
  MRUVolumeGroupCoordinator *v6;
  MRUVolumeGroupCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeGroupCoordinator;
  v6 = -[MRUVolumeGroupCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainVolumeController, a3);
    -[MRUVolumeController setCoordinationDelegate:](v7->_mainVolumeController, "setCoordinationDelegate:", v7);
  }

  return v7;
}

- (void)setVolumeControllers:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_volumeControllers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10++), "setCoordinationDelegate:", 0);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_volumeControllers, a3);
  -[MRUVolumeGroupCoordinator updateVolumeScales](self, "updateVolumeScales");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setCoordinationDelegate:", self, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (BOOL)shouldAllowEqualization
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  float v8;
  float v9;
  float v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_volumeControllers, "count") < 2)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_volumeControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "volumeValue", (_QWORD)v13);
        v9 = v8;
        -[MRUVolumeController volumeValue](self->_mainVolumeController, "volumeValue");
        if (vabds_f32(v9, v10) > 0.00000011921)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)beginEqualization
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_volumeControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "beginEqualization", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)equalizeVolumes
{
  int v3;
  int v4;
  NSArray *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MRUVolumeController volumeValue](self->_mainVolumeController, "volumeValue");
  v4 = v3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_volumeControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        LODWORD(v7) = v4;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setVolumeValue:", v7, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)finishEqualization
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_volumeControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "finishEqualization", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  void *v5;
  float v6;
  float v7;
  unint64_t v8;
  MRUVolumeController *v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  void *v14;
  MRUVolumeController *v15;

  v15 = (MRUVolumeController *)a3;
  -[MRUVolumeGroupCoordinator updateVolumeScales](self, "updateVolumeScales");
  if (self->_mainVolumeController == v15)
  {
    -[MRUVolumeController volumeValue](v15, "volumeValue");
    v7 = v6;
    if (-[NSArray count](self->_volumeControllers, "count"))
    {
      v8 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_volumeControllers, "objectAtIndexedSubscript:", v8);
        v9 = (MRUVolumeController *)objc_claimAutoreleasedReturnValue();
        if (v9 != v15)
        {
          -[NSArray objectAtIndexedSubscript:](self->_volumeScales, "objectAtIndexedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "floatValue");
          v12 = v11;

          *(float *)&v13 = v7 * v12;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRUVolumeController setOptimisticValue:](v9, "setOptimisticValue:", v14);

        }
        ++v8;
      }
      while (-[NSArray count](self->_volumeControllers, "count") > v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeController setOptimisticValue:](self->_mainVolumeController, "setOptimisticValue:", v5);

  }
}

- (float)updateVolumeScales
{
  uint64_t v3;
  NSArray *volumeControllers;
  void *v5;
  void *v6;
  float v7;
  NSArray *v8;
  NSArray *volumeScales;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = (float *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  volumeControllers = self->_volumeControllers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke;
  v12[3] = &unk_1E581C2A8;
  v12[4] = &v13;
  -[NSArray msv_map:](volumeControllers, "msv_map:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v14[6];
  if (v7 > 0.0)
  {
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke_2;
    v11[3] = &unk_1E581C2D0;
    v11[4] = &v13;
    objc_msgSend(v5, "msv_map:", v11);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    volumeScales = self->_volumeScales;
    self->_volumeScales = v8;

    v7 = v14[6];
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke(uint64_t a1, void *a2)
{
  float v3;
  uint64_t v4;
  float v5;

  objc_msgSend(a2, "volumeValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(float *)(v4 + 24);
  if (v5 < v3)
    v5 = v3;
  *(float *)(v4 + 24) = v5;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
}

uint64_t __47__MRUVolumeGroupCoordinator_updateVolumeScales__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  float v4;
  double v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  *(float *)&v5 = v4 / *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return objc_msgSend(v3, "numberWithFloat:", v5);
}

- (MRUVolumeController)mainVolumeController
{
  return self->_mainVolumeController;
}

- (NSArray)volumeControllers
{
  return self->_volumeControllers;
}

- (NSArray)volumeScales
{
  return self->_volumeScales;
}

- (void)setVolumeScales:(id)a3
{
  objc_storeStrong((id *)&self->_volumeScales, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeScales, 0);
  objc_storeStrong((id *)&self->_volumeControllers, 0);
  objc_storeStrong((id *)&self->_mainVolumeController, 0);
}

@end
