@implementation NSKeyedArchiver(CalClassAdditions)

+ (uint64_t)CalArchivedDataWithRootObject:()CalClassAdditions ofClasses:error:
{
  return objc_msgSend(a1, "CalArchivedDataWithRootObject:ofClasses:strict:error:", a3, a4, 0, a5);
}

+ (id)CalArchivedDataWithRootObject:()CalClassAdditions ofClasses:strict:error:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v20[0] = 0;
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v10, v11, v20);
    v13 = (void *)v20[0];
  }
  else
  {
    v19 = 0;
    v14 = (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v11, &v19);
    v13 = v19;
  }
  v15 = v13;
  v16 = v15;
  if (a6)
    *a6 = objc_retainAutorelease(v15);
  if (v16)
    v17 = 0;
  else
    v17 = v11;

  return v17;
}

@end
