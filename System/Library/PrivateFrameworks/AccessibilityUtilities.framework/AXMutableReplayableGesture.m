@implementation AXMutableReplayableGesture

- (void)addPointsByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  int v12;
  NSArray *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *allEvents;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (v11)
    _AXAssert();
  if (!self->super._allEvents)
  {
    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allEvents = self->super._allEvents;
    self->super._allEvents = v16;

    if (!v12)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v12)
  {
LABEL_12:
    v13 = self->super._allEvents;
    v18[0] = CFSTR("Time");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = v8;
    v18[1] = CFSTR("Fingers");
    v18[2] = CFSTR("Forces");
    v19[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v13, "addObject:", v15);

  }
LABEL_13:

}

- (void)addPointsFromReplayableGesture:(id)a3
{
  id *v4;
  NSArray *allEvents;
  NSArray *v6;
  NSArray *v7;
  id *v8;

  v4 = (id *)a3;
  if (v4)
  {
    allEvents = self->super._allEvents;
    v8 = v4;
    if (allEvents)
    {
      -[NSArray addObjectsFromArray:](allEvents, "addObjectsFromArray:", v4[1]);
    }
    else
    {
      v6 = (NSArray *)objc_msgSend(v4[1], "mutableCopy");
      v7 = self->super._allEvents;
      self->super._allEvents = v6;

    }
    v4 = v8;
  }

}

- (void)_addPoint:(CGPoint)a3 force:(double)a4 forFingerIdentifier:(id)a5 atTime:(double)a6
{
  double y;
  double x;
  id v11;
  NSArray *allEvents;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  y = a3.y;
  x = a3.x;
  v26[3] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  allEvents = self->super._allEvents;
  if (!allEvents)
  {
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = self->super._allEvents;
    self->super._allEvents = v13;

    allEvents = self->super._allEvents;
  }
  v25[0] = CFSTR("Time");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v25[1] = CFSTR("Fingers");
  v23 = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "axValueWithCGPoint:", x, y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  v25[2] = CFSTR("Forces");
  v21 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](allEvents, "addObject:", v20);

}

- (void)_addPoint:(CGPoint)a3 force:(double)a4 forFingerIdentifier:(id)a5 atEventIndex:(unint64_t)a6
{
  double y;
  double x;
  NSArray *allEvents;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  y = a3.y;
  x = a3.x;
  v23[3] = *MEMORY[0x1E0C80C00];
  allEvents = self->super._allEvents;
  v12 = a5;
  -[NSArray objectAtIndexedSubscript:](allEvents, "objectAtIndexedSubscript:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Fingers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3B18], "axValueWithCGPoint:", x, y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v12);

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Forces"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v12);

  v22[0] = CFSTR("Fingers");
  v22[1] = CFSTR("Forces");
  v23[0] = v15;
  v23[1] = v18;
  v22[2] = CFSTR("Time");
  objc_msgSend(v13, "objectForKeyedSubscript:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray setObject:atIndexedSubscript:](self->super._allEvents, "setObject:atIndexedSubscript:", v21, a6);
}

- (void)_removeFingersAtEventIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[NSArray objectAtIndexedSubscript:](self->super._allEvents, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("Fingers");
  v8[1] = CFSTR("Forces");
  v9[0] = MEMORY[0x1E0C9AA70];
  v9[1] = MEMORY[0x1E0C9AA70];
  v8[2] = CFSTR("Time");
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray setObject:atIndexedSubscript:](self->super._allEvents, "setObject:atIndexedSubscript:", v7, a3);
}

- (id)_pointsByFingerIdentifierAtEventIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->super._allEvents, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Fingers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_forcesByFingerIdentifierAtEventIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->super._allEvents, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Forces"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
