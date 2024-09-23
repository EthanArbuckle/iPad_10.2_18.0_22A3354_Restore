@implementation NSError(GEOZilchDecoder)

+ (uint64_t)zilchDecoderErrorForNoSolution
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GEOZilchDecoderErrorDomain"), 2, 0);
}

- (id)zilchDecoderTileLoadingError
{
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v3))
  {
    GEOStringForError(objc_msgSend(a1, "code"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Unknown tile loading error");
  }

  v5 = *MEMORY[0x1E0CB2D50];
  v9[0] = *MEMORY[0x1E0CB3388];
  v9[1] = v5;
  v10[0] = a1;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GEOZilchDecoderErrorDomain"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
