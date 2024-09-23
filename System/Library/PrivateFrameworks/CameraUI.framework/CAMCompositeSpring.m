@implementation CAMCompositeSpring

- (void)updateForTimestamp:(double)a3
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CAMSpring _currentForce](self, "_currentForce");
  v6 = v5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CAMCompositeSpring addedSprings](self, "addedSprings", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[CAMSpring _current](self, "_current");
        objc_msgSend(v12, "_setCurrent:");
        -[CAMSpring velocity](self, "velocity");
        objc_msgSend(v12, "setVelocity:");
        objc_msgSend(v12, "_currentForce");
        v6 = v6 + v13;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[CAMSpring _updateWithForce:timestamp:](self, "_updateWithForce:timestamp:", v6, a3);
}

- (NSArray)addedSprings
{
  return self->_addedSprings;
}

- (void)setAddedSprings:(id)a3
{
  objc_storeStrong((id *)&self->_addedSprings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedSprings, 0);
}

@end
