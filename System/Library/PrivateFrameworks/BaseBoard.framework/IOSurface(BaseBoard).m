@implementation IOSurface(BaseBoard)

+ (uint64_t)bs_IOSurfaceWithWidth:()BaseBoard height:options:
{
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  objc_class *v43;
  void *v44;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  id v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[6];
  _QWORD v62[6];
  _QWORD v63[6];
  _QWORD v64[6];
  _QWORD v65[2];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("options"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v42;
      v68 = 2114;
      v69 = v44;
      v70 = 2048;
      v71 = a1;
      v72 = 2114;
      v73 = CFSTR("IOSurface+BaseBoard.m");
      v74 = 1024;
      v75 = 52;
      v76 = 2114;
      v77 = v41;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1CA6E8);
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("in_width >= 0"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v46;
      v68 = 2114;
      v69 = v48;
      v70 = 2048;
      v71 = a1;
      v72 = 2114;
      v73 = CFSTR("IOSurface+BaseBoard.m");
      v74 = 1024;
      v75 = 53;
      v76 = 2114;
      v77 = v45;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1CA7F0);
  }
  if ((a4 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("in_height >= 0"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v50;
      v68 = 2114;
      v69 = v52;
      v70 = 2048;
      v71 = a1;
      v72 = 2114;
      v73 = CFSTR("IOSurface+BaseBoard.m");
      v74 = 1024;
      v75 = 54;
      v76 = 2114;
      v77 = v49;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1CA8F8);
  }
  if (MEMORY[0x18D769168](*MEMORY[0x1E0CBC1E0]) >= a3 && MEMORY[0x18D769168](*MEMORY[0x1E0CBC008]) >= a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x1E0CBBDD0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, *MEMORY[0x1E0CBBD88]);

    objc_msgSend(v11, "setObject:forKey:", &unk_1E1EDA0E8, *MEMORY[0x1E0CBBD80]);
    v14 = *MEMORY[0x1E0CBBF08];
    if ((*(_BYTE *)a5 & 4) != 0)
    {
      v19 = MEMORY[0x18D769138](*MEMORY[0x1E0CBBF08], 8 * a3);
      objc_msgSend(v11, "setObject:forKey:", &unk_1E1EDA100, *MEMORY[0x1E0CBBD90]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v20, *MEMORY[0x1E0CBBD70]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v18, *MEMORY[0x1E0CBBD78]);
      v16 = v19 * a4;
    }
    else
    {
      v15 = MEMORY[0x18D769138](*MEMORY[0x1E0CBBF08], 4 * a3);
      v16 = v15 * a4;
      if ((*a5 & 2) != 0)
      {
        if ((*a5 & 1) != 0)
        {
          objc_msgSend(v11, "setObject:forKey:", &unk_1E1EDA118, *MEMORY[0x1E0CBBD90]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v39, *MEMORY[0x1E0CBBD70]);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v40, *MEMORY[0x1E0CBBD78]);

        }
        else
        {
          v23 = MEMORY[0x18D769138](v14, a3);
          v24 = (_QWORD *)MEMORY[0x1E0CBBDC8];
          v63[0] = *MEMORY[0x1E0CBBDC8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = v60;
          v63[1] = *MEMORY[0x1E0CBBDA8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v64[1] = v59;
          v25 = (_QWORD *)MEMORY[0x1E0CBBD98];
          v63[2] = *MEMORY[0x1E0CBBD98];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v64[2] = v58;
          v63[3] = *MEMORY[0x1E0CBBDA0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (_QWORD *)MEMORY[0x1E0CBBDB8];
          v28 = *MEMORY[0x1E0CBBDB8];
          v57 = (void *)v26;
          v64[3] = v26;
          v64[4] = &unk_1E1EDA130;
          v29 = (_QWORD *)MEMORY[0x1E0CBBDC0];
          v30 = *MEMORY[0x1E0CBBDC0];
          v63[4] = v28;
          v63[5] = v30;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v16);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v64[5] = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 6);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = v56;
          v61[0] = *v24;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
          v31 = v29;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v55;
          v61[1] = *MEMORY[0x1E0CBBDA8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v62[1] = v54;
          v61[2] = *v25;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v62[2] = v32;
          v61[3] = *MEMORY[0x1E0CBBDA0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v23);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v62[3] = v33;
          v61[4] = *v27;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v16);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v23 * a4;
          v62[4] = v34;
          v61[5] = *v31;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v62[5] = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 6);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v65[1] = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setObject:forKey:", &unk_1E1EDA148, *MEMORY[0x1E0CBBD90]);
          objc_msgSend(v11, "setObject:forKey:", v38, *MEMORY[0x1E0CBBDB0]);

          v16 += v35;
        }
        goto LABEL_12;
      }
      objc_msgSend(v11, "setObject:forKey:", &unk_1E1EDA160, *MEMORY[0x1E0CBBD90]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v17, *MEMORY[0x1E0CBBD70]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v18, *MEMORY[0x1E0CBBD78]);
    }

    *a5 &= 0xFFFFFFFFFFFFFFFCLL;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", MEMORY[0x18D769138](*MEMORY[0x1E0CBBEE0], v16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v21, *MEMORY[0x1E0CBBD68]);

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithProperties:", v11);
    return v10;
  }
  return 0;
}

- (BSCGImageFromIOSurfaceBuilder)CGImageBuilder
{
  BSCGImageFromIOSurfaceBuilder *v2;
  id v3;
  BSCGImageFromIOSurfaceBuilder *v4;
  objc_super v6;

  v2 = [BSCGImageFromIOSurfaceBuilder alloc];
  v3 = a1;
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)BSCGImageFromIOSurfaceBuilder;
    v4 = (BSCGImageFromIOSurfaceBuilder *)objc_msgSendSuper2(&v6, sel_init);
    v2 = v4;
    if (v4)
      objc_storeStrong((id *)&v4->_surface, a1);
  }

  return v2;
}

@end
