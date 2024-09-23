@implementation AVScrubbingPanGestureRecognizer

- (CGPoint)velocity
{
  double v2;
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (self && (unint64_t)(-[AVScrubbingPanGestureRecognizer state](self, "state") - 1) <= 1)
  {
    -[AVPanGestureIncrement velocity](self->_lastPanGestureIncrement, "velocity");
    v2 = v5;
    v3 = v6;
  }
  v7 = v2;
  v8 = v3;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)translation
{
  double v2;
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (self && (unint64_t)(-[AVScrubbingPanGestureRecognizer state](self, "state") - 1) <= 1)
  {
    -[AVPanGestureIncrement translation](self->_lastPanGestureIncrement, "translation");
    v2 = v5;
    v3 = v6;
  }
  v7 = v2;
  v8 = v3;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *candidateGestureIncrements;
  AVPanGestureIncrement *v9;
  AVPanGestureIncrement *lastPanGestureIncrement;
  AVPanGestureIncrement *v11;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  candidateGestureIncrements = self->_candidateGestureIncrements;
  self->_candidateGestureIncrements = v7;

  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, v6);
  v9 = (AVPanGestureIncrement *)objc_claimAutoreleasedReturnValue();

  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = v9;
  v11 = v9;

  -[NSMutableArray addObject:](self->_candidateGestureIncrements, "addObject:", v11);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  AVScrubbingPanGestureRecognizer *v6;
  uint64_t v7;
  NSMutableArray *candidateGestureIncrements;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  BOOL v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lastPanGestureIncrement, v5);
  if ((unint64_t)(-[AVScrubbingPanGestureRecognizer state](self, "state") - 1) > 1)
  {
    -[NSMutableArray addObject:](self->_candidateGestureIncrements, "addObject:", v5);
    candidateGestureIncrements = self->_candidateGestureIncrements;
    -[AVScrubbingPanGestureRecognizer view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = candidateGestureIncrements;
    objc_opt_self();
    if ((unint64_t)-[NSMutableArray count](v10, "count") > 1)
    {
      -[NSMutableArray lastObject](v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray firstObject](v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "translation");
      v14 = v13;
      v16 = v15;
      objc_msgSend(v11, "translation");
      v18 = v17 - v14;
      v20 = v19 - v16;
      *(float *)&v17 = v17 - v14;
      *(float *)&v19 = v19 - v16;
      v21 = hypotf(*(float *)&v17, *(float *)&v19);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v10 = v10;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v22)
      {
        v23 = v22;
        v36 = v11;
        v37 = v9;
        v24 = 0;
        v25 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v25)
              objc_enumerationMutation(v10);
            v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v27, "velocity", v36, v37, (_QWORD)v38);
            v29 = v28;
            v31 = v30;
            if ((objc_msgSend(v27, "hasMultipleTouches") & 1) != 0)
            {

              v11 = v36;
              v9 = v37;
LABEL_22:

              v35 = self->_candidateGestureIncrements;
              self->_candidateGestureIncrements = 0;

              v7 = 5;
              goto LABEL_26;
            }
            v32 = v31 != 0.0 || v29 != 0.0;
            v24 += v32;
          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v23)
            continue;
          break;
        }

        v33 = v24 < 3 || v21 <= 15.0;
        v11 = v36;
        v9 = v37;
        if (!v33)
        {
          if (fabs(v18) > fabs(v20))
          {

            v34 = self->_candidateGestureIncrements;
            self->_candidateGestureIncrements = 0;

            v7 = 1;
            goto LABEL_26;
          }
          goto LABEL_22;
        }
      }
      else
      {

      }
    }

    v7 = 0;
LABEL_26:
    v6 = self;
  }
  else
  {
    v6 = self;
    v7 = 2;
  }
  -[AVScrubbingPanGestureRecognizer setState:](v6, "setState:", v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  AVPanGestureIncrement *v5;
  AVPanGestureIncrement *lastPanGestureIncrement;
  uint64_t v7;

  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  v5 = (AVPanGestureIncrement *)objc_claimAutoreleasedReturnValue();
  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = v5;

  if ((unint64_t)(-[AVScrubbingPanGestureRecognizer state](self, "state") - 1) >= 2)
    v7 = 5;
  else
    v7 = 3;
  -[AVScrubbingPanGestureRecognizer setState:](self, "setState:", v7);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  AVPanGestureIncrement *v5;
  AVPanGestureIncrement *lastPanGestureIncrement;
  uint64_t v7;

  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  v5 = (AVPanGestureIncrement *)objc_claimAutoreleasedReturnValue();
  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = v5;

  if ((unint64_t)(-[AVScrubbingPanGestureRecognizer state](self, "state") - 1) < 2)
    v7 = 4;
  else
    v7 = 5;
  -[AVScrubbingPanGestureRecognizer setState:](self, "setState:", v7);
}

- (void)reset
{
  NSMutableArray *candidateGestureIncrements;
  AVPanGestureIncrement *lastPanGestureIncrement;

  candidateGestureIncrements = self->_candidateGestureIncrements;
  self->_candidateGestureIncrements = 0;

  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = 0;

}

- (void)_debugLogGestureIncrements:(id)a3 withPrefix:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ {\n"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "debugDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%ld %@\n"), v10 + v12, v15, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v6;
      }
      while (v9 != v12);
      v10 += v12;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "stringByAppendingString:", CFSTR("}"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("%@"), v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPanGestureIncrement, 0);
  objc_storeStrong((id *)&self->_candidateGestureIncrements, 0);
}

- (id)_getPanGestureIncrementForTouches:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  _BOOL8 v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    v12 = objc_msgSend(v3, "count");

    v13 = v12 > 1 || (unint64_t)objc_msgSend(v2, "numberOfTouches") > 1;
    v14 = v2[35];
    if (v14)
    {
      objc_msgSend(v14, "translation");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v2[35], "timestamp");
      v20 = v11 - v19;
      v21 = (v7 - v16) / v20;
      v22 = (v9 - v18) / v20;
    }
    else
    {
      v21 = *MEMORY[0x1E0C9D538];
      v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    +[AVPanGestureIncrement gestureIncrementWithTranslation:velocity:timestamp:hasMultipleTouches:](AVPanGestureIncrement, "gestureIncrementWithTranslation:velocity:timestamp:hasMultipleTouches:", v13, v7, v9, v21, v22, v11);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
