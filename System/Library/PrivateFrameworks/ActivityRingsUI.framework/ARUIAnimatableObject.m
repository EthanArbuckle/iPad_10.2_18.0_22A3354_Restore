@implementation ARUIAnimatableObject

- (void)update:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_animatableProperties, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "update:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setValue:(id)a3 forPropertyType:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ARUIAnimatableObject removeAllAnimationsForPropertyType:](self, "removeAllAnimationsForPropertyType:", a4);
  -[ARUIAnimatableObject _animatablePropertyForType:](self, "_animatablePropertyForType:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValueImmediate:", v6);

}

- (void)addAnimation:(id)a3 forPropertyType:(unint64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *animatableProperties;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!self->_animatableProperties)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    animatableProperties = self->_animatableProperties;
    self->_animatableProperties = v6;

  }
  -[ARUIAnimatableObject _animatablePropertyForType:](self, "_animatablePropertyForType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setStartValue:", v9);
  objc_msgSend(v11, "_setCurrentValue:", v10);
  objc_msgSend(v8, "addPropertyAnimation:", v11);

}

- (void)removeAllAnimationsForPropertyType:(unint64_t)a3
{
  id v3;

  -[ARUIAnimatableObject _animatablePropertyForType:](self, "_animatablePropertyForType:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPropertyAnimations");

}

- (BOOL)areAnimationsInProgress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_animatableProperties, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isFinishedAnimating"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_animatablePropertyForType:(unint64_t)a3
{
  NSMutableDictionary *animatableProperties;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;

  animatableProperties = self->_animatableProperties;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](animatableProperties, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[ARUIAnimatableObject _newAnimatablePropertyForType:](self, "_newAnimatablePropertyForType:", a3);
    v8 = self->_animatableProperties;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (id)endingValueForPropertyType:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[ARUIAnimatableObject _animatablePropertyForType:](self, "_animatablePropertyForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatableProperties, 0);
}

- (id)_newAnimatablePropertyForType:(unint64_t)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
