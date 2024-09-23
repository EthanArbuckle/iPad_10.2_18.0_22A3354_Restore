@implementation AXNamedReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXNamedReplayableGesture)initWithCoder:(id)a3
{
  id v4;
  AXNamedReplayableGesture *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXNamedReplayableGesture;
  v5 = -[AXReplayableGesture initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_hasLocalizableName;
    *(_QWORD *)&v5->_hasLocalizableName = v6;

    *(&v5->super.super._arePointsDeviceRelative + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasLocalizableName"));
    *(&v5->super.super._arePointsDeviceRelative + 2) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShouldPerformAtOriginalLocation"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXNamedReplayableGesture;
  v4 = a3;
  -[AXReplayableGesture encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)&self->_hasLocalizableName, CFSTR("Name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 1), CFSTR("HasLocalizableName"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 2), CFSTR("ShouldPerformAtOriginalLocation"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void **v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (void **)v4;
    v6 = *(void **)&self->_hasLocalizableName;
    if ((v6 == v5[3] || objc_msgSend(v6, "isEqualToString:"))
      && *((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 1) == *((unsigned __int8 *)v5 + 17)
      && *((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 2) == *((unsigned __int8 *)v5 + 18))
    {
      v9.receiver = self;
      v9.super_class = (Class)AXNamedReplayableGesture;
      v7 = -[AXReplayableGesture isEqual:](&v9, sel_isEqual_, v5);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)gestureShiftedByOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  NSUInteger v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  y = a3.y;
  x = a3.x;
  v37 = *MEMORY[0x1E0C80C00];
  if (-[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative"))
    _AXAssert();
  v5 = objc_alloc_init((Class)objc_opt_class());
  -[AXNamedReplayableGesture name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_msgSend(v5, "setHasLocalizableName:", -[AXNamedReplayableGesture hasLocalizableName](self, "hasLocalizableName"));
  objc_msgSend(v5, "setShouldPerformAtOriginalLocation:", -[AXNamedReplayableGesture shouldPerformAtOriginalLocation](self, "shouldPerformAtOriginalLocation"));
  v30 = -[NSArray count](self->super.super._allEvents, "count");
  if (v30)
  {
    for (i = 0; i != v30; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->super.super._allEvents, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Time"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      -[NSArray objectAtIndexedSubscript:](self->super.super._allEvents, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Forces"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](self->super.super._allEvents, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Fingers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v16, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v16, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "axCGPointValue");
            v25 = v24;
            v27 = v26;

            objc_msgSend(MEMORY[0x1E0CB3B18], "axValueWithCGPoint:", x + v25, y + v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v19);
      }

      objc_msgSend(v5, "addPointsByFingerIdentifier:forces:atTime:", v16, v13, v11);
    }
  }
  return v5;
}

+ (id)_fingerIdentifierForFingerAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + 1);
}

+ (id)gestureWithLegacyFormatDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Points"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Times"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Forces"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "gestureWithPoints:times:forces:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsDoubleTap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    if (objc_msgSend(v8, "numberOfEvents") != 2)
      _AXAssert();
    if (objc_msgSend(v8, "numberOfEvents") == 2)
    {
      objc_msgSend(v8, "_removeFingersAtEventIndex:", 1);
      objc_msgSend(v8, "timeAtEventIndex:", 0);
      v12 = v11;
      objc_msgSend(v8, "timeAtEventIndex:", 1);
      v14 = v13;
      v15 = v13 - v12;
      objc_msgSend(v8, "_pointsByFingerIdentifierAtEventIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_forcesByFingerIdentifierAtEventIndex:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addPointsByFingerIdentifier:forces:atTime:", v16, v17, v14 + 0.05);

      objc_msgSend(v8, "addPointsByFingerIdentifier:forces:atTime:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v14 + 0.05 + v15);
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v18);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasLocalizableName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasLocalizableName:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShouldPerformAtOriginalLocation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldPerformAtOriginalLocation:", objc_msgSend(v20, "BOOLValue"));

  return v8;
}

+ (id)gestureWithPoints:(id)a3 times:(id)a4 forces:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v35;
  id v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36 = a1;
  v11 = objc_alloc_init((Class)objc_opt_class());
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = -1;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __59__AXNamedReplayableGesture_gestureWithPoints_times_forces___block_invoke;
  v37[3] = &unk_1E24C8AC8;
  v37[4] = &v42;
  v37[5] = &v38;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v37);
  v12 = v39[3];
  if ((v12 & 0x8000000000000000) != 0 || v12 >= objc_msgSend(v9, "count"))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v39[3]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = v9;
  v14 = objc_msgSend(v8, "count");
  objc_msgSend(v13, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v18 = v43;
  if (v43[3] >= 1)
  {
    v19 = 0;
    do
    {
      if (v14 >= 1)
      {
        for (i = 0; i != v14; ++i)
        {
          objc_msgSend(v8, "objectAtIndex:", i);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (i >= objc_msgSend(v10, "count"))
          {
            v22 = 0;
          }
          else
          {
            objc_msgSend(v10, "objectAtIndex:", i);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v19 < objc_msgSend(v21, "count"))
          {
            objc_msgSend(v21, "objectAtIndex:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = AX_CGPointFromString(v23);
            v26 = v25;

            v27 = 0.0;
            v28 = 0.0;
            if (v19 < objc_msgSend(v22, "count"))
            {
              objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              v28 = v30;

            }
            if (v19)
            {
              if (v19 >= objc_msgSend(v13, "count"))
                objc_msgSend(v13, "lastObject");
              else
                objc_msgSend(v13, "objectAtIndex:", v19);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "doubleValue");
              v27 = v32 - v17;

            }
            if (v19 >= objc_msgSend(v11, "numberOfEvents"))
            {
              objc_msgSend(v36, "_fingerIdentifierForFingerAtIndex:", i);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "_addPoint:force:forFingerIdentifier:atTime:", v33, v24, v26, v28, v27);
            }
            else
            {
              objc_msgSend(v36, "_fingerIdentifierForFingerAtIndex:", i);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "_addPoint:force:forFingerIdentifier:atEventIndex:", v33, v19, v24, v26, v28);
            }

          }
        }
        v18 = v43;
      }
      ++v19;
    }
    while ((uint64_t)v19 < v18[3]);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v11;
}

unint64_t __59__AXNamedReplayableGesture_gestureWithPoints_times_forces___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t result;
  unint64_t v7;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "count");
  if (v5 <= result)
    v7 = result;
  else
    v7 = v5;
  if (v7 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  }
  return result;
}

- (NSString)name
{
  return *(NSString **)&self->_hasLocalizableName;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_hasLocalizableName, a3);
}

- (BOOL)hasLocalizableName
{
  return *(&self->super.super._arePointsDeviceRelative + 1);
}

- (void)setHasLocalizableName:(BOOL)a3
{
  *(&self->super.super._arePointsDeviceRelative + 1) = a3;
}

- (BOOL)shouldPerformAtOriginalLocation
{
  return *(&self->super.super._arePointsDeviceRelative + 2);
}

- (void)setShouldPerformAtOriginalLocation:(BOOL)a3
{
  *(&self->super.super._arePointsDeviceRelative + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasLocalizableName, 0);
}

@end
