@implementation BSMutableKeyedSettings

- (void)setFlag:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v8, a3 != 0x7FFFFFFFFFFFFFFFLL);
  -[BSSettings _setFlag:forSetting:]((uint64_t)self, a3, v6);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BSKeyedSettings objectForKey:](self, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[BSMutableIntegerMap removeObjectForKey:](self->super._keyMap, "removeObjectForKey:", v6);
      -[NSMutableSet removeObject:](self->super._keys, "removeObject:", v8);
    }
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v6, v8 != 0);
  -[BSSettings _setObject:forSetting:]((uint64_t)self, v8, v7);
  if (!v8 && -[BSKeyedSettings flagForKey:](self, "flagForKey:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BSMutableIntegerMap removeObjectForKey:](self->super._keyMap, "removeObjectForKey:", v7);
    -[NSMutableSet removeObject:](self->super._keys, "removeObject:", v6);
  }

}

- (BOOL)_isMutable
{
  return 1;
}

- (void)applySettings:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BSMutableKeyedSettings *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v12 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isKeyedSettings");
    v6 = v12;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!settings || [settings isKeyedSettings]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2048;
        v18 = self;
        v19 = 2114;
        v20 = CFSTR("BSKeyedSettings.m");
        v21 = 1024;
        v22 = 283;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      __break(0);
      JUMPOUT(0x18A19D3D4);
    }
  }
  objc_msgSend(v6, "_applyToSettings:", self);

}

- (void)setFlag:(int64_t)a3 forSetting:(unint64_t)a4
{
  -[BSSettings _setFlag:forSetting:]((uint64_t)self, a3, a4);
}

- (void)setObject:(id)a3 forSetting:(unint64_t)a4
{
  -[BSSettings _setObject:forSetting:]((uint64_t)self, a3, a4);
}

@end
