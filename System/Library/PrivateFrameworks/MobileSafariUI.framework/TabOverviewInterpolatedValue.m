@implementation TabOverviewInterpolatedValue

- (double)value
{
  if (a1)
    return *(double *)(a1 + 40);
  else
    return 0.0;
}

- (uint64_t)setEpsilon:(uint64_t)result
{
  if (result)
    *(double *)(result + 56) = a2;
  return result;
}

- (double)initWithValue:(double)a3 decelerationFactor:
{
  double *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  if (!a1)
    return 0;
  v11.receiver = a1;
  v11.super_class = (Class)TabOverviewInterpolatedValue;
  v5 = (double *)objc_msgSendSuper2(&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    v5[7] = 0.0001;
    v5[8] = a3;
    -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v5, a2);
  }
  return v5;
}

- (void)resetToValue:(uint64_t)a1
{
  void *v3;

  if (a1)
  {
    *(double *)(a1 + 24) = a2;
    *(double *)(a1 + 40) = a2;
    *(double *)(a1 + 48) = a2;
    objc_msgSend(*(id *)(a1 + 16), "removeAllObjects");
    v3 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[TabOverviewInterpolatedValue _removeFromDependants](a1);
  }
}

- (void)_removeFromDependants
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(a1 + 8);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
          if (v7)
            objc_msgSend(*(id *)(v7 + 16), "removeObject:", a1, (_QWORD)v9);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

    v8 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
}

- (void)setTargetValue:(uint64_t)a1
{
  if (a1)
  {
    if ((_SFEqualWithEpsilon() & 1) == 0)
    {
      *(double *)(a1 + 48) = a2;
      -[TabOverviewInterpolatedValue _removeFromDependants](a1);
    }
  }
}

- (void)resetToTargetValue
{
  if (a1)
    -[TabOverviewInterpolatedValue resetToValue:](a1, *(double *)(a1 + 48));
}

- (uint64_t)isInSteadyState
{
  if (a1 && _SFEqualWithEpsilon())
    return _SFEqualWithEpsilon();
  else
    return 0;
}

- (uint64_t)_dependenciesAreInSteadyState
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 16);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5);
        if (v6 && !-[TabOverviewInterpolatedValue isInSteadyState](v6))
        {
          v7 = 0;
          goto LABEL_13;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (uint64_t)interpolateByTimeInterval:(uint64_t)result
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    result = -[TabOverviewInterpolatedValue _dependenciesAreInSteadyState](result);
    if ((_DWORD)result)
    {
      v4 = _SFEqualWithEpsilon();
      pow(*(long double *)(v3 + 64), a2 * 1000.0);
      _SFInterpolate();
      *(_QWORD *)(v3 + 24) = v5;
      _SFInterpolate();
      *(_QWORD *)(v3 + 40) = v6;
      if ((_SFEqualWithEpsilon() & 1) != 0)
        *(_QWORD *)(v3 + 24) = *(_QWORD *)(v3 + 48);
      if (_SFEqualWithEpsilon())
        *(_QWORD *)(v3 + 40) = *(_QWORD *)(v3 + 24);
      if (v4)
        return _SFEqualWithEpsilon() ^ 1;
      else
        return 1;
    }
  }
  return result;
}

- (double)resetLastRenderedValue
{
  double result;

  if (a1)
  {
    result = *(double *)(a1 + 40);
    *(double *)(a1 + 32) = result;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; value = %f; targetValue = %f; instantaneousTargetValue = %f"),
    v5,
    self,
    *(_QWORD *)&self->_value,
    *(_QWORD *)&self->_targetValue,
    *(_QWORD *)&self->_instantaneousTargetValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSHashTable count](self->_dependencies, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; numberOfDependencies = %d"),
      -[NSHashTable count](self->_dependencies, "count"));
  if (-[NSHashTable count](self->_dependants, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; numberOfDependants = %d"),
      -[NSHashTable count](self->_dependants, "count"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (uint64_t)isSteadyAtTargetValue:(uint64_t)a1
{
  if (a1 && _SFEqualWithEpsilon())
    return -[TabOverviewInterpolatedValue isInSteadyState](a1);
  else
    return 0;
}

- (double)targetValue
{
  if (a1)
    return *(double *)(a1 + 48);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_dependants, 0);
}

@end
