@implementation CAAnimationGroup(AVTExtensions)

- (id)avt_animationsByUngroupingRecursively
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "animations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "avt_animationsByUngroupingRecursively");
          v9 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = objc_msgSend(v8, "copy");
            objc_msgSend(v8, "beginTime");
            -[NSObject setBeginTime:](v9, "setBeginTime:");
            objc_msgSend(v8, "speed");
            v11 = v10;
            objc_msgSend(a1, "speed");
            *(float *)&v13 = v11 * v12;
            -[NSObject setSpeed:](v9, "setSpeed:", v13);
            objc_msgSend(v8, "timeOffset");
            v15 = v14;
            objc_msgSend(a1, "beginTime");
            v17 = v15 - v16;
            objc_msgSend(a1, "speed");
            v19 = v18;
            objc_msgSend(a1, "timeOffset");
            -[NSObject setTimeOffset:](v9, "setTimeOffset:", v20 + v17 * v19);
            objc_msgSend(v2, "addObject:", v9);
          }
          else
          {
            avt_default_log();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[CAAnimationGroup(AVTExtensions) avt_animationsByUngroupingRecursively].cold.1(v26, (uint64_t)v8, &v27, v9);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v5);
  }

  return v2;
}

- (void)avt_animationsByUngroupingRecursively
{
  objc_class *v7;
  void *v8;

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl(&dword_1DD1FA000, a4, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unsupported animation class %@", a1, 0xCu);

}

@end
