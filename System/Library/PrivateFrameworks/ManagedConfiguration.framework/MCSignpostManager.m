@implementation MCSignpostManager

+ (id)signpostsForTypeFilter:(unint64_t)a3 featureFilter:(id)a4 duration:(double)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("signpost manager disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("MCSignpostManager"), -1, v8);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
