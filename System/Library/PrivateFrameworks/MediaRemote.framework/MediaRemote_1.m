MRPlaybackQueueRequest *MRPlaybackQueueRequestCreateWithCurrentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[MRPlaybackQueueRequest initWithIdentifiers:range:]([MRPlaybackQueueRequest alloc], "initWithIdentifiers:range:", a3, a1, a2);
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestCopy(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCopy(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 40, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "copy");
}

void *MRPlaybackQueueRequestCopyWithRange(void *a1, uint64_t a2, uint64_t a3)
{
  void *v7;
  void *v8;
  uint64_t v9;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCopyWithRange(MRPlaybackQueueRequestRef, CFRange)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 48, CFSTR("Type mismatch, expecting %@ found %@"), v9, objc_opt_class());

    }
  }
  return MRPlaybackQueueRequestCopyWithCurrentState(a1, a2, a3, 0);
}

void *MRPlaybackQueueRequestCopyWithCurrentState(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a1;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCopyWithCurrentState(MRPlaybackQueueRequestRef, CFRange, CFArrayRef)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_class();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 56, CFSTR("Type mismatch, expecting %@ found %@"), v12, objc_opt_class());

    }
  }
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "setContentItemIdentifiers:", a4);
  objc_msgSend(v8, "setLocation:", a2);
  objc_msgSend(v8, "setLength:", a3);

  return v8;
}

void *MRPlaybackQueueRequestCreateMergedRequest(void *a1, void *a2)
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  uint64_t v9;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCreateMergedRequest(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 67, CFSTR("Type mismatch, expecting %@ found %@"), v9, objc_opt_class());

    }
  }
  v4 = a2;
  v5 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v5, "mergeFrom:", v4);

  return v5;
}

uint64_t MRPlaybackQueueRequestSetIncludeLyrics(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setIncludeLyrics:", a2);
}

uint64_t MRPlaybackQueueRequestSetIncludeSections(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setIncludeSections:", a2);
}

uint64_t MRPlaybackQueueRequestSetIncludeAlignments(void *a1, uint64_t a2)
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRPlaybackQueueRequestSetIncludeAlignments(MRPlaybackQueueRequestRef, _Bool)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_class();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 120, CFSTR("Type mismatch, expecting %@ found %@"), v7, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "setIncludeAlignments:", a2);
}

void *MRPlaybackQueueRequestGetRequestID(void *a1)
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef MRPlaybackQueueRequestGetRequestID(MRPlaybackQueueRequestRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 145, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  objc_msgSend(a1, "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MRPlaybackQueueRequestSetRequestID(void *a1, uint64_t a2)
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRPlaybackQueueRequestSetRequestID(MRPlaybackQueueRequestRef, CFStringRef)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_class();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 153, CFSTR("Type mismatch, expecting %@ found %@"), v7, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "setRequestIdentifier:", a2);
}

uint64_t MRPlaybackQueueRequestCopyDescription(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef MRPlaybackQueueRequestCopyDescription(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 161, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  objc_msgSend(a1, "description");
  return objc_claimAutoreleasedReturnValue();
}

void *MRPlaybackQueueRequestGetLabel(void *a1)
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef MRPlaybackQueueRequestGetLabel(MRPlaybackQueueRequestRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 177, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  objc_msgSend(a1, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void *MRPlaybackQueueRequestGetRequestedIdentifiers(void *a1)
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFArrayRef MRPlaybackQueueRequestGetRequestedIdentifiers(MRPlaybackQueueRequestRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 185, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  objc_msgSend(a1, "contentItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL MRPlaybackQueueRequestRangeContainsNowPlayingItem(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestRangeContainsNowPlayingItem(MRPlaybackQueueRequestRef)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 201, CFSTR("Type mismatch, expecting %@ found %@"), v10, objc_opt_class());

    }
  }
  v2 = a1;
  v3 = objc_msgSend(v2, "location");
  v4 = objc_msgSend(v2, "location");
  v5 = objc_msgSend(v2, "length");

  return v3 < 1 && v5 + v4 > 0;
}

uint64_t MRPlaybackQueueRequestGetIncludeLyrics(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestGetIncludeLyrics(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 219, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "includeLyrics");
}

uint64_t MRPlaybackQueueRequestGetArtworkWidth(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double MRPlaybackQueueRequestGetArtworkWidth(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 259, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "artworkWidth");
}

uint64_t MRPlaybackQueueRequestGetArtworkHeight(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double MRPlaybackQueueRequestGetArtworkHeight(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 267, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "artworkHeight");
}

uint64_t MRPlaybackQueueRequestShouldRequestItem(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestShouldRequestItem(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 275, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "shouldRequestItem");
}

uint64_t MRPlaybackQueueRequestShouldRequestItemNotConsideringMetadata(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestShouldRequestItemNotConsideringMetadata(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 283, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "shouldRequestItemNotConsideringMetadata");
}

uint64_t MRPlaybackQueueRequestContainsNonDefaultAssets(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestContainsNonDefaultAssets(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 291, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "containsNonDefaultAssets");
}

uint64_t MRPlaybackQueueRequestCreateSkeletonFrom(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCreateSkeletonFrom(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 299, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  objc_msgSend(a1, "skeleton");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestCreateExternalRepresentation(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef MRPlaybackQueueRequestCreateExternalRepresentation(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 307, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  objc_msgSend(a1, "data");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestHasRange(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestHasRange(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 315, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "hasRange");
}

MRPlaybackQueueRequest *MRPlaybackQueueRequestCreateFromExternalRepresentation(uint64_t a1)
{
  return -[MRPlaybackQueueRequest initWithData:]([MRPlaybackQueueRequest alloc], "initWithData:", a1);
}

uint64_t MRPlaybackQueueRequestMatch(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 340, CFSTR("Type mismatch, expecting %@ found %@"), v9, objc_opt_class());

    if (!v4)
      goto LABEL_6;
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 341, CFSTR("Type mismatch, expecting %@ found %@"), v12, objc_opt_class());

  }
LABEL_6:
  if (v3)
    v5 = objc_msgSend(v3, "match:", v4);
  else
    v5 = 1;

  return v5;
}

uint64_t MRPlaybackQueueRequestIsExactMatch(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestIsExactMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 350, CFSTR("Type mismatch, expecting %@ found %@"), v9, objc_opt_class());

    if (!v4)
      goto LABEL_6;
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MRPlaybackQueueRequestIsExactMatch(MRPlaybackQueueRequestRef, MRPlaybackQueueRequestRef)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 351, CFSTR("Type mismatch, expecting %@ found %@"), v12, objc_opt_class());

  }
LABEL_6:
  v5 = objc_msgSend(v3, "exactMatch:", v4);

  return v5;
}

uint64_t MRPlaybackQueueRequestGetReturnContentItemAssetsInUserCompletion()
{
  return 1;
}

id MRPlaybackQueueRequestCreateFromTransactionName(uint64_t a1)
{
  return -[MRPlaybackQueueRequest initFromTransactionName:]([MRPlaybackQueueRequest alloc], "initFromTransactionName:", a1);
}

uint64_t MRPlaybackQueueRequestCreateDefaultWithRange(uint64_t a1, uint64_t a2)
{
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", a1, a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRPlaybackQueueRequestSetIsLegacyNowPlayingInfoRequest(void *a1, uint64_t a2)
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRPlaybackQueueRequestSetIsLegacyNowPlayingInfoRequest(MRPlaybackQueueRequestRef, _Bool)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_class();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 378, CFSTR("Type mismatch, expecting %@ found %@"), v7, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "setLegacyNowPlayingInfoRequest:", a2);
}

uint64_t MRPlaybackQueueRequestGetIsLegacyNowPlayingInfoRequest(void *a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool MRPlaybackQueueRequestGetIsLegacyNowPlayingInfoRequest(MRPlaybackQueueRequestRef)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_class();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 386, CFSTR("Type mismatch, expecting %@ found %@"), v5, objc_opt_class());

    }
  }
  return objc_msgSend(a1, "isLegacyNowPlayingInfoRequest");
}

MRPlaybackQueueRequest *MRPlaybackQueueRequestCreateAssetsFrom(uint64_t a1)
{
  MRPlaybackQueueRequest *v2;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueueRequestRef MRPlaybackQueueRequestCreateAssetsFrom(MRPlaybackQueueRequestRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MRPlaybackQueueRequest_Deprecated.m"), 394, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  v2 = objc_alloc_init(MRPlaybackQueueRequest);
  MRPlaybackQueueRequestMerge(v2, a1);
  return v2;
}

void sub_193A5D278(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

uint64_t MRBundlePermittedForJoiningGroupSessions(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MediaRemoteUI"));

  return v2;
}

uint64_t MRGroupSessionRouteTypeFromModelIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("AudioAccessory5")) & 1) != 0)
  {
    v2 = 9;
  }
  else if (objc_msgSend(v1, "containsString:", CFSTR("AudioAccessory")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *MRGroupSessionRouteTypeToModelIdentifier(char a1)
{
  if ((a1 - 8) > 3u)
    return 0;
  else
    return off_1E30CF6D0[(char)(a1 - 8)];
}

id MRGroupSessionTokenCreateWithInvitationData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRGroupSessionToken * _Nonnull MRGroupSessionTokenCreateWithInvitationData(NSData *__strong _Nonnull, NSString * _Nullable __strong, NSNumber *__strong _Nonnull)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MRGroupSession.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  MRGetSharedService();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createTokenWithInvitationData:equivalentMediaIdentifier:version:", v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id MRGroupSessionRouteMakeName(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = a1;
  v4 = v3;
  if (a2 > 0xB || ((1 << a2) & 0xB00) != 0)
    goto LABEL_8;
  if (((1 << a2) & 6) == 0)
  {
    if (a2 == 5)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = CFSTR("GROUPSESSION_ROUTE_FORMAT_SPEAKER");
      goto LABEL_7;
    }
LABEL_8:
    v8 = v3;
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = CFSTR("GROUPSESSION_ROUTE_FORMAT_CAR");
LABEL_7:
  MRLocalizedStringWithFormat(v6, 0, CFSTR("%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v8;
}

void MRGroupSessionJoinSessionWithToken(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRGroupSessionJoinSessionWithToken(MRGroupSessionToken *__strong _Nonnull, void (^__strong _Nonnull)(NSString *__strong, NSError * _Nullable __strong))");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MRGroupSession.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  MRGetSharedService();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Requesting to join session with token: %@", buf, 0xCu);
  }

  MRGroupSessionSubsystemGetQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __MRGroupSessionJoinSessionWithToken_block_invoke;
  v12[3] = &unk_1E30CF578;
  v13 = v3;
  v14 = v4;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v5, "joinGroupSessionWithToken:queue:completion:", v8, v7, v12);

}

id MRGroupSessionSubsystemGetQueue()
{
  if (MRGroupSessionSubsystemGetQueue_onceToken != -1)
    dispatch_once(&MRGroupSessionSubsystemGetQueue_onceToken, &__block_literal_global_100);
  return (id)MRGroupSessionSubsystemGetQueue___queue;
}

void sub_193A5FC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void MRGroupSessionLeaveSessionWithIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRGroupSessionLeaveSessionWithIdentifier(NSString *__strong _Nonnull, void (^__strong _Nonnull)(NSError * _Nullable __strong))");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MRGroupSession.m"), 562, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

  }
  MRGetSharedService();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Requesting to leave session with identifier: %@", buf, 0xCu);
  }

  MRGroupSessionSubsystemGetQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MRGroupSessionLeaveSessionWithIdentifier_block_invoke;
  v11[3] = &unk_1E30C6798;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v5, "leaveGroupSessionWithIdentifier:queue:completion:", v3, v7, v11);

}

id MRGroupSessionSubsystemGetNotificationQueue()
{
  if (MRGroupSessionSubsystemGetNotificationQueue_onceToken != -1)
    dispatch_once(&MRGroupSessionSubsystemGetNotificationQueue_onceToken, &__block_literal_global_520);
  return (id)MRGroupSessionSubsystemGetNotificationQueue___queue;
}

void sub_193A604F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

const __CFString *MRGroupSessionRouteTypeDescription(int a1)
{
  if ((a1 - 1) > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E30CF748[(char)(a1 - 1)];
}

void sub_193A60D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A60E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A60F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A6106C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A611C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A61314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A6145C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A61578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A616D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A61838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A61C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193A62140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193A624E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void MRGroupSessionSendEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = a1;
  MRGetSharedService();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  MRGroupSessionSubsystemGetQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:queue:completion:", v4, v5, v3);

}

void sub_193A62CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MRSetGroupSessionNearbyContactDiscoveryEnabled(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "groupSessionNearbyContactDiscoveryEnabled");

  if (v3 != (_DWORD)a1)
  {
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGroupSessionNearbyContactDiscoveryEnabled:", a1);

  }
}

uint64_t MRGroupSessionNearbyContactDiscoveryEnabled()
{
  void *v0;
  uint64_t v1;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "groupSessionNearbyContactDiscoveryEnabled");

  return v1;
}

void MRSetGroupSessionContactAutoApprovalEnabled(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "groupSessionContactAutoApprovalEnabled");

  if (v3 != (_DWORD)a1)
  {
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGroupSessionContactAutoApprovalEnabled:", a1);

  }
}

uint64_t MRGroupSessionContactAutoApprovalEnabled()
{
  void *v0;
  uint64_t v1;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "groupSessionContactAutoApprovalEnabled");

  return v1;
}

id MRGroupSessionRouteTypeLocalizedString(int a1)
{
  __CFString *v1;

  if ((a1 - 1) > 0xA)
    v1 = CFSTR("GROUPSESSION_ROUTE_SPEAKER");
  else
    v1 = off_1E30CF6F0[(char)(a1 - 1)];
  MRLocalizedString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t MROutputDeviceTypeFromGroupSessionRoute(int a1)
{
  if ((a1 - 1) > 0xA)
    return 0;
  else
    return dword_193ADA8D8[(char)(a1 - 1)];
}

uint64_t MROutputDeviceSubtypeFromGroupSessionRoute(int a1)
{
  if ((a1 - 1) > 0xA)
    return 0;
  else
    return dword_193ADA904[(char)(a1 - 1)];
}

uint64_t MRGroupSessionRouteTypeForOutputDevices(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v6, "deviceType", (_QWORD)v15) == 3)
        {
          v13 = 2;
          goto LABEL_32;
        }
        if (objc_msgSend(v6, "deviceType") == 2 || objc_msgSend(v6, "deviceType") == 5)
        {
          if (objc_msgSend(v6, "deviceSubtype") == 14
            || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
                v7 = (void *)objc_claimAutoreleasedReturnValue(),
                v8 = objc_msgSend(v7, "startGroupSessionsForAllRouteSubtypes"),
                v7,
                (v8 & 1) != 0))
          {
            v13 = 1;
            goto LABEL_32;
          }
          if (objc_msgSend(v6, "deviceSubtype") == 1)
          {
            +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "supportGroupSessionHome");

            if ((v10 & 1) != 0)
            {
LABEL_27:
              v13 = 5;
              goto LABEL_32;
            }
          }
        }
        if (objc_msgSend(v6, "deviceType") == 1)
        {
          +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "supportGroupSessionHome");

          if (v12)
          {
            if (objc_msgSend(v6, "deviceSubtype") == 13)
            {
              v13 = 11;
              goto LABEL_32;
            }
            if (objc_msgSend(v6, "deviceSubtype") == 12
              || objc_msgSend(v6, "deviceSubtype") == 15)
            {
              if (objc_msgSend(v6, "isB520Device"))
                v13 = 9;
              else
                v13 = 8;
              goto LABEL_32;
            }
            if (objc_msgSend(v6, "deviceSubtype") == 1
              || objc_msgSend(v6, "deviceSubtype") == 11
              || objc_msgSend(v6, "deviceSubtype") == 17)
            {
              goto LABEL_27;
            }
          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_32:

  return v13;
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_8_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t _MRRemoveClientMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRNowPlayingClientProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRNowPlayingClientProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRNowPlayingClientProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_193A67B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193A68098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 256), 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Block_object_dispose((const void *)(v53 - 160), 8);
  _Block_object_dispose((const void *)(v53 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_193A6A4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193A6A598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MRGroupSessionIdentityShareMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRUserIdentityProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRUserIdentityProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRUserIdentityProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL _MRGetRemoteTextInputSessionProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t _MRAudioFadeMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  _MRNowPlayingPlayerPathProtobuf *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRGameControllerAccelerationProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t result;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              PBReaderReadData();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = *(void **)(a1 + 8);
              *(_QWORD *)(a1 + 8) = v18;

              goto LABEL_43;
            case 2u:
              *(_BYTE *)(a1 + 32) |= 2u;
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v29);
                *(_QWORD *)(a2 + v28) = v29 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v30 = 20;
              goto LABEL_42;
            case 3u:
              *(_BYTE *)(a1 + 32) |= 4u;
              v20 = *v3;
              v21 = *(_QWORD *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v21);
                *(_QWORD *)(a2 + v20) = v21 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v30 = 24;
              goto LABEL_42;
            case 4u:
              *(_BYTE *)(a1 + 32) |= 8u;
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v30 = 28;
              goto LABEL_42;
            case 5u:
              *(_BYTE *)(a1 + 32) |= 1u;
              v25 = *v3;
              v26 = *(_QWORD *)(a2 + v25);
              if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v26);
                *(_QWORD *)(a2 + v25) = v26 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v30 = 16;
LABEL_42:
              *(_DWORD *)(a1 + v30) = v22;
              goto LABEL_43;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_43:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_193A6DD64(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_193A6E118(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_193A6E8F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _MRKeyboardMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  _MRTextEditingAttributesProtobuf *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v24;

      }
      else if ((_DWORD)v17 == 3)
      {
        v26 = objc_alloc_init(_MRTextEditingAttributesProtobuf);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || !_MRTextEditingAttributesProtobufReadFrom((uint64_t)v26, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *MRGroupTopologyModificationRequestTypeDescription(uint64_t a1)
{
  if (a1 < 4)
    return off_1E30CF8B0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t _MRErrorProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  _MRErrorProtobuf *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_31;
      case 2u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_38:
        *(_DWORD *)(a1 + 8) = v22;
        goto LABEL_39;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_31;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
LABEL_31:
        v26 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_39;
      case 5u:
        v27 = objc_alloc_init(_MRErrorProtobuf);
        objc_msgSend((id)a1, "addUnderlyingErrors:", v27);
        if (PBReaderPlaceMark() && (_MRErrorProtobufReadFrom(v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t _MRGetVolumeMutedMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRAudioDataBlockProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  _MRAudioTimeProtobuf *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_QWORD *)(a1 + 8) = v22;
      }
      else
      {
        if ((_DWORD)v18 == 2)
        {
          v19 = objc_alloc_init(_MRAudioTimeProtobuf);
          objc_storeStrong((id *)(a1 + 24), v19);
          if (!PBReaderPlaceMark() || !_MRAudioTimeProtobufReadFrom((uint64_t)v19, a2))
          {
LABEL_36:

            return 0;
          }
        }
        else
        {
          if ((_DWORD)v18 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v19 = objc_alloc_init(_MRAudioBufferProtobuf);
          objc_storeStrong((id *)(a1 + 16), v19);
          if (!PBReaderPlaceMark() || (_MRAudioBufferProtobufReadFrom((uint64_t)v19, a2) & 1) == 0)
            goto LABEL_36;
        }
        PBReaderRecallMark();

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRRegisterGameControllerMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRGameControllerPropertiesProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRGameControllerPropertiesProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (_MRGameControllerPropertiesProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRSendCommandResultMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  _MRNowPlayingPlayerPathProtobuf *v31;
  uint64_t v32;
  void *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v16 = v10 & 7;
    if (v15 || v16 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 68) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_52;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_54;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_54:
        *(_DWORD *)(a1 + 64) = v20;
        goto LABEL_65;
      case 2u:
        if (v16 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            while (1)
            {
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
                break;
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_40;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          while (1)
          {
            v37 = *v3;
            v38 = *(_QWORD *)(a2 + v37);
            if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
              break;
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              v14 = v35++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_64;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
          PBRepeatedInt32Add();
        }
        goto LABEL_65;
      case 3u:
        PBReaderReadData();
        v31 = (_MRNowPlayingPlayerPathProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend((id)a1, "addHandlerReturnStatusData:", v31);
        goto LABEL_50;
      case 4u:
        PBReaderReadString();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v32;

        goto LABEL_65;
      case 5u:
        v31 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 56), v31);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v31->super.super.isa, a2))
        {
          goto LABEL_68;
        }
        goto LABEL_49;
      case 6u:
        v31 = objc_alloc_init(_MRSendCommandResultProtobuf);
        objc_storeStrong((id *)(a1 + 40), v31);
        if (PBReaderPlaceMark() && (_MRSendCommandResultProtobufReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
LABEL_49:
          PBReaderRecallMark();
LABEL_50:

LABEL_65:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_68:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_65;
    }
  }
}

void MRServiceClientPlaybackSessionCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *Error;
  void (**v14)(id, _QWORD, void *);

  v14 = a3;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originClientForPlayerPath:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerClientForPlayerPath:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "playbackSessionCallback");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void (**)(id, _QWORD, void *)))(v9 + 16))(v9, a2, a1, v14);
  }
  else
  {
    objc_msgSend(v8, "clientCallbacks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playbackSessionCallback");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v12[2](v12, a2, v14);
    }
    else
    {
      Error = (void *)MRMediaRemoteCreateError(15);
      v14[2](v14, 0, Error);

    }
  }

}

void MRServiceClientPlaybackSessionMigrateBeginCallback(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originClientForPlayerPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerClientForPlayerPath:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "playbackSessionMigrateBeginCallback");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __MRServiceClientPlaybackSessionMigrateBeginCallback_block_invoke;
    v18[3] = &unk_1E30C6748;
    v19 = v7;
    ((void (**)(_QWORD, id, id, _QWORD *))v12)[2](v12, v6, v5, v18);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
  }
  else
  {
    objc_msgSend(v11, "clientCallbacks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playbackSessionMigrateBeginCallback");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "addPendingPlaybackSessionMigrateEvent:", v6);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __MRServiceClientPlaybackSessionMigrateBeginCallback_block_invoke_2;
      v16[3] = &unk_1E30C6748;
      v17 = v7;
      ((void (**)(_QWORD, id, _QWORD *))v13)[2](v13, v6, v16);

    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 15);
      (*((void (**)(id, void *))v7 + 2))(v7, v15);

    }
  }

}

void MRServiceClientPlaybackSessionMigrateEndCallback(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originClientForPlayerPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playerClientForPlayerPath:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "playbackSessionMigrateEndCallback");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __MRServiceClientPlaybackSessionMigrateEndCallback_block_invoke;
    v21[3] = &unk_1E30C6748;
    v22 = v10;
    ((void (**)(_QWORD, id, id, id, _QWORD *))v15)[2](v15, v9, v8, v7, v21);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v22;
  }
  else
  {
    objc_msgSend(v14, "clientCallbacks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "playbackSessionMigrateEndCallback");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (objc_msgSend(v14, "removePendingPlaybackSessionMigrateEvent:", v9))
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __MRServiceClientPlaybackSessionMigrateEndCallback_block_invoke_2;
        v19[3] = &unk_1E30C6748;
        v20 = v10;
        ((void (**)(_QWORD, id, id, _QWORD *))v16)[2](v16, v9, v8, v19);

      }
      else
      {
        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      }
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 15);
      (*((void (**)(id, void *))v10 + 2))(v10, v18);

    }
  }

}

void MRServiceClientPlaybackSessionMigrateRequestCallback(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *Error;
  id v19;

  v19 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originClientForPlayerPath:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerClientForPlayerPath:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "playbackSessionMigrateRequestCallback");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, id, id, id, void (**)(id, id, void *)))(v14 + 16))(v14, v7, v8, v19, v9);
  }
  else
  {
    objc_msgSend(v13, "clientCallbacks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playbackSessionMigrateRequestCallback");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      ((void (**)(_QWORD, id, id, void (**)(id, id, void *)))v17)[2](v17, v7, v8, v9);
    }
    else
    {
      Error = (void *)MRMediaRemoteCreateError(15);
      v9[2](v9, v8, Error);

    }
  }

}

uint64_t _MRPlaybackSessionMigrateResponseMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRPlaybackSessionMigrateRequestProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRPlaybackSessionMigrateRequestProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (_MRPlaybackSessionMigrateRequestProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void *MRLyricsItemGetLyrics(void *a1)
{
  void *v1;

  objc_msgSend(a1, "lyrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void *MRLyricsItemGetToken(void *a1)
{
  void *v1;

  objc_msgSend(a1, "token");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

_MRLyricsTokenProtobuf *MRLyricsItemTokenCreate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _MRLyricsTokenProtobuf *v4;

  if (a2)
    v3 = MSVArchivedDataWithRootObject();
  else
    v3 = 0;
  v4 = objc_alloc_init(_MRLyricsTokenProtobuf);
  -[_MRLyricsTokenProtobuf setIdentifier:](v4, "setIdentifier:", a1);
  -[_MRLyricsTokenProtobuf setUserData:](v4, "setUserData:", v3);
  return v4;
}

_MRLyricsTokenProtobuf *MRLyricsItemTokenCreateWithData(uint64_t a1, uint64_t a2)
{
  _MRLyricsTokenProtobuf *v4;

  v4 = objc_alloc_init(_MRLyricsTokenProtobuf);
  -[_MRLyricsTokenProtobuf setIdentifier:](v4, "setIdentifier:", a1);
  -[_MRLyricsTokenProtobuf setUserData:](v4, "setUserData:", a2);
  return v4;
}

void *MRLyricsItemTokenGetIdentifier(void *a1)
{
  void *v1;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void *MRLyricsItemTokenGetUserInfo(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "userData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MSVUnarchivedObjectOfClasses();

  }
  return v2;
}

_MRLyricsEventProtobuf *MRLyricsEventCreateBegin(uint64_t a1, uint64_t a2)
{
  _MRLyricsEventProtobuf *v4;

  v4 = objc_alloc_init(_MRLyricsEventProtobuf);
  MEMORY[0x194036008](a1);
  -[_MRLyricsEventProtobuf setStartTime:](v4, "setStartTime:");
  -[_MRLyricsEventProtobuf setToken:](v4, "setToken:", a2);
  return v4;
}

_MRLyricsEventProtobuf *MRLyricsEventCreateEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _MRLyricsEventProtobuf *v6;

  v6 = objc_alloc_init(_MRLyricsEventProtobuf);
  MEMORY[0x194036008](a1);
  -[_MRLyricsEventProtobuf setStartTime:](v6, "setStartTime:");
  if (a2)
  {
    MEMORY[0x194036008](a2);
    -[_MRLyricsEventProtobuf setEndTime:](v6, "setEndTime:");
  }
  -[_MRLyricsEventProtobuf setToken:](v6, "setToken:", a3);
  return v6;
}

uint64_t MRLyricsItemTokenCreateExternalRepresentation(void *a1)
{
  objc_msgSend(a1, "data");
  return objc_claimAutoreleasedReturnValue();
}

_MRLyricsTokenProtobuf *MRLyricsItemTokenCreateFromExternalRepresentation(uint64_t a1)
{
  return -[_MRLyricsTokenProtobuf initWithData:]([_MRLyricsTokenProtobuf alloc], "initWithData:", a1);
}

void *MRLyricsEventGetToken(void *a1)
{
  void *v1;

  objc_msgSend(a1, "token");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t MRLyricsEventCreateExternalRepresentation(void *a1)
{
  objc_msgSend(a1, "data");
  return objc_claimAutoreleasedReturnValue();
}

_MRLyricsEventProtobuf *MRLyricsEventCreateFromExternalRepresentation(uint64_t a1)
{
  return -[_MRLyricsEventProtobuf initWithData:]([_MRLyricsEventProtobuf alloc], "initWithData:", a1);
}

void MRMediaRemoteSetBeginLyricsEventCallback(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originClientForOrigin:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBeginLyricsEventCallback:", v3);
}

void MRMediaRemoteSetBeginLyricsEventCallbackForPlayer(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerClientForPlayerPath:", a1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientCallbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBeginLyricsEventCallback:", v3);

}

void MRMediaRemoteSetEndLyricsEventCallback(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originClientForOrigin:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEndLyricsEventCallback:", v3);
}

void MRMediaRemoteSetEndLyricsEventCallbackForPlayer(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerClientForPlayerPath:", a1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientCallbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndLyricsEventCallback:", v3);

}

void MRMediaRemoteRemoteSendLyricsEvent(uint64_t a1, uint64_t a2, void *a3)
{
  MRPlayerPath *v4;

  v4 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", a1, a2, 0);
  MRMediaRemoteRemoteSendLyricsEventForPlayer(v4, a3);

}

void MRMediaRemoteRemoteSendLyricsEventForPlayer(void *a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = a2;
    v8 = 2112;
    v9 = a1;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Sending Lyrics Event: %@ for PlayerPath %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSendLyricsEvent(v5, a1, a2);
}

void sub_193A75614(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A756F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A75764(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A757D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A75828(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A75898(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A758EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A7595C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A759B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A75D08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A75FBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A760C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A7635C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A76A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  void *v24;

  objc_sync_exit(v24);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

id _onClientQueue_MRCreateSectionsForRequest(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t (**v8)(id, _QWORD, id);
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MRPlaybackQueueServiceClient.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientState"));

    if (v8)
    {
LABEL_3:
      if (v9)
        goto LABEL_4;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("MRPlaybackQueueServiceClient.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

      if (v10)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MRPlaybackQueueServiceClient.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("datasource"));

  if (!v9)
    goto LABEL_11;
LABEL_4:
  if (v10)
    goto LABEL_5;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onClientQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, __strong MRPlaybackQueueDataSourceCreateChildContentItemCallback, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("MRPlaybackQueueServiceClient.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

LABEL_5:
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = v8[2](v8, 0, v10);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", v13);

      v13 = (void *)v8[2](v8, v14++, v10);
    }
    while (v13);
  }
  v15 = (void *)objc_msgSend(v11, "copy");

  return v15;
}

id _onQueue_MRCreateSectionsForRequest(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *Identifier;
  const char *AncestorIdentifier;
  id v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  _BYTE *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v34 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, NSArray<MSVCallback *> *__strong, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("MRPlaybackQueueServiceClient.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientState"));

  }
  v35 = v9;
  if (v9)
  {
    if (v10)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, NSArray<MSVCallback *> *__strong, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("MRPlaybackQueueServiceClient.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v10)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<MRContentItem *> *_onQueue_MRCreateSectionsForRequest(MRNowPlayingPlayerClient *__strong, NSArray<MSVCallback *> *__strong, MRPlaybackQueueRequest *__strong, MRContentItem *__strong)");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("MRPlaybackQueueServiceClient.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

LABEL_5:
  v11 = MRContentItemCopyMinimalReadableDescription(v10);
  _MRLogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueServiceClient] playbackQueueRequest %{public}@ requesting child item of %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__49;
  v53 = __Block_byref_object_dispose__49;
  v54 = (id)MEMORY[0x1E0C9AA60];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v46;
LABEL_9:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
      objc_msgSend(v16, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___onQueue_MRCreateSectionsForRequest_block_invoke;
      block[3] = &unk_1E30CFB30;
      block[4] = v16;
      v41 = v10;
      v44 = buf;
      v42 = v7;
      v43 = v9;
      dispatch_sync((dispatch_queue_t)v17, block);

      LOBYTE(v17) = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
      if ((v17 & 1) == 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v13)
          goto LABEL_9;
        break;
      }
    }
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        Identifier = (const char *)MRContentItemGetIdentifier(v10);
        MRContentItemSetParentIdentifier(v22, Identifier);
        AncestorIdentifier = (const char *)MRContentItemGetAncestorIdentifier(v10);
        MRContentItemSetAncestorIdentifier(v22, AncestorIdentifier);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v19);
  }

  v25 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v25;
}

void sub_193A77FBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

MRPlaybackQueue *_onClientQueue_MRCreatePlaybackQueueForOffset(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t (**v5)(id, _QWORD);
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  MRPlaybackQueue *v10;
  void *v12;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueue *_onClientQueue_MRCreatePlaybackQueueForOffset(NSRange, __strong MRPlaybackQueueDataSourceCreateContentItemCallback)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("MRPlaybackQueueServiceClient.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("datasource"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a2);
  for (i = 0; a2; --a2)
  {
    v8 = (void *)v5[2](v5, a1);
    v9 = objc_msgSend(v6, "count");
    if (v8)
    {
      if (!v9)
        i = a1;
      objc_msgSend(v6, "addObject:", v8);
    }
    else if (v9)
    {
      break;
    }

    ++a1;
  }
  v10 = -[MRPlaybackQueue initWithContentItems:location:]([MRPlaybackQueue alloc], "initWithContentItems:location:", v6, i);

  return v10;
}

id _onQueue_MRCreatePlaybackQueueForOffset(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD block[9];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v20 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueue *_onQueue_MRCreatePlaybackQueueForOffset(MRPlaybackQueueRequest *__strong, NSArray<MSVCallback *> *__strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MRPlaybackQueueServiceClient.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__49;
  v31 = __Block_byref_object_dispose__49;
  v32 = 0;
  v4 = objc_msgSend(v3, "range");
  v6 = v5;
  v19 = v3;
  if (v5)
  {
    v7 = v4;
    v21 = 0;
    while (1)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = v20;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v24;
LABEL_7:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
          objc_msgSend(v12, "queue");
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = ___onQueue_MRCreatePlaybackQueueForOffset_block_invoke;
          block[3] = &unk_1E30CFB58;
          block[4] = v12;
          block[5] = &v27;
          block[6] = v21 + v7;
          block[7] = v7;
          block[8] = v6;
          dispatch_sync(v13, block);

          if (v28[5])
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
            if (v9)
              goto LABEL_7;
            break;
          }
        }
      }

      v14 = (void *)v28[5];
      if (v14)
        break;
      if (++v21 == v6)
      {
        v14 = 0;
        break;
      }
    }
  }
  else
  {
    v14 = (void *)v28[5];
  }
  v15 = v14;
  _Block_object_dispose(&v27, 8);

  return v15;
}

void sub_193A7843C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

MRPlaybackQueue *_onQueue_MRCreatePlaybackQueueForIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MRContentItem *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  MRPlaybackQueue *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  _QWORD block[5];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRPlaybackQueue *_onQueue_MRCreatePlaybackQueueForIdentifier(MRPlaybackQueueRequest *__strong, NSArray<MSVCallback *> *__strong)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("MRPlaybackQueueServiceClient.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v26 = v3;
  objc_msgSend(v3, "contentItemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    v27 = *MEMORY[0x1E0C9AE00];
    v28 = *(_QWORD *)v41;
    v29 = v4;
    do
    {
      v10 = 0;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v10);
        if (objc_msgSend(v4, "count"))
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v12 = (MRContentItem *)v4;
          v13 = -[MRContentItem countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v13)
          {
            v14 = v13;
            v32 = v10;
            v15 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v37 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                objc_msgSend(v17, "block");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "queue");
                v19 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = ___onQueue_MRCreatePlaybackQueueForIdentifier_block_invoke;
                block[3] = &unk_1E30C6658;
                v35 = v18;
                block[4] = v11;
                v34 = v6;
                v20 = v18;
                dispatch_sync(v19, block);

              }
              v14 = -[MRContentItem countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v14);
            v9 = v28;
            v4 = v29;
            v8 = v30;
            v10 = v32;
          }
        }
        else
        {
          v12 = MRContentItemCreate(v27, v11);
          objc_msgSend(v6, "addObject:", v12);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v8);
  }

  v21 = -[MRPlaybackQueue initWithContentItems:]([MRPlaybackQueue alloc], "initWithContentItems:", v6);
  return v21;
}

void *OUTLINED_FUNCTION_1_9(uint64_t a1, void *a2)
{
  return MRContentItemCopyMinimalReadableDescription(a2);
}

uint64_t _MRPlaybackQueueContextProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

CFStringRef MR_NSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return (id)CFStringCreateWithFormat(0, 0, CFSTR("{{%.*g, %.*g}, {%.*g, %.*g}}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2, 17, *(_QWORD *)&a3, 17, *(_QWORD *)&a4);
}

uint64_t _MRTransactionPacketsProtobufReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRTransactionPacketProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRTransactionPacketProtobuf);
        objc_msgSend(a1, "addPackets:", v17);
        if (!PBReaderPlaceMark() || (_MRTransactionPacketProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_193A7D8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t _MRAudioStreamPacketDescriptionProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_51:
        v36 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 24) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_45;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_47;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
            if (*(_BYTE *)(a2 + *v5))
              v20 = 0;
LABEL_47:
            *(_QWORD *)(a1 + 8) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v30 = 0;
        v31 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 4u;
        while (1)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            break;
          v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v33 + 1;
          v26 |= (unint64_t)(v34 & 0x7F) << v30;
          if ((v34 & 0x80) == 0)
            goto LABEL_53;
          v30 += 7;
          v14 = v31++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_55:
        v36 = 20;
      }
      *(_DWORD *)(a1 + v36) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_193A7EC3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A7F11C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A7F218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A7FB5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A7FDF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A800F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A802B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A804A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A80F88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A8142C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A81530(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A816B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A81CC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A81D4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initPCProgressEvent()
{
  Class result;

  if (ProximityControlLibrary_sOnce != -1)
    dispatch_once(&ProximityControlLibrary_sOnce, &__block_literal_global_109);
  result = objc_getClass("PCProgressEvent");
  classPCProgressEvent = (uint64_t)result;
  getPCProgressEventClass = (uint64_t (*)())PCProgressEventFunction;
  return result;
}

id PCProgressEventFunction()
{
  return (id)classPCProgressEvent;
}

Class initPCMediaRemoteDisplayContext()
{
  Class result;

  if (ProximityControlLibrary_sOnce != -1)
    dispatch_once(&ProximityControlLibrary_sOnce, &__block_literal_global_109);
  result = objc_getClass("PCMediaRemoteDisplayContext");
  classPCMediaRemoteDisplayContext = (uint64_t)result;
  getPCMediaRemoteDisplayContextClass = (uint64_t (*)())PCMediaRemoteDisplayContextFunction;
  return result;
}

id PCMediaRemoteDisplayContextFunction()
{
  return (id)classPCMediaRemoteDisplayContext;
}

BOOL _MRTransactionKeyProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL _MRSendHIDReportMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRRemovePlayerMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRNowPlayingPlayerPathProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

_MRDiagnosticProtobuf *MRDiagnosticCreate(uint64_t a1, uint64_t a2)
{
  _MRDiagnosticProtobuf *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRDiagnosticRef MRDiagnosticCreate(CFDateRef, CFStringRef)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MRDiagnostic.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (a2)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRDiagnosticRef MRDiagnosticCreate(CFDateRef, CFStringRef)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MRDiagnostic.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("info"));

    goto LABEL_3;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v4 = objc_alloc_init(_MRDiagnosticProtobuf);
  MEMORY[0x194036008](a1);
  -[_MRDiagnosticProtobuf setDateGenerated:](v4, "setDateGenerated:");
  -[_MRDiagnosticProtobuf setDiagnosticInfo:](v4, "setDiagnosticInfo:", a2);
  return v4;
}

_MRDiagnosticProtobuf *MRDiagnosticCreateFromExternalRepresentation(uint64_t a1)
{
  return -[_MRDiagnosticProtobuf initWithData:]([_MRDiagnosticProtobuf alloc], "initWithData:", a1);
}

uint64_t MRDiagnosticCreateExternalRepresentation(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

CFDateRef MRDiagnosticCopyDateCreated(void *a1)
{
  const __CFAllocator *v1;
  CFAbsoluteTime v2;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(a1, "dateGenerated");
  return CFDateCreate(v1, v2);
}

uint64_t MRDiagnosticCopyInfo(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "diagnosticInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

void MRMediaRemoteCollectDiagnostic(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = a1;
  v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceCollectDiagnostic(v4, v5, v3);

}

void MRMediaRemoteCollectClientDiagnostics(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = a1;
  v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceCollectClientDiagnostics(v4, v5, v3);

}

MRMutableVirtualTouchDeviceDescriptor *MRVirtualTouchDeviceDescriptorCreate()
{
  return objc_alloc_init(MRMutableVirtualTouchDeviceDescriptor);
}

uint64_t MRVirtualTouchDeviceDescriptorSetIsAbsolute(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setAbsolute:", a2);
}

uint64_t MRVirtualTouchDeviceDescriptorSetDisplayIntegrated(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setIntegratedDisplay:", a2);
}

uint64_t _MRCryptoPairingMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_53:
          v43 = 20;
          goto LABEL_67;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_57:
          v44 = v28 != 0;
          v45 = 24;
          goto LABEL_62;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 28) |= 8u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_61:
          v44 = v34 != 0;
          v45 = 25;
LABEL_62:
          *(_BYTE *)(a1 + v45) = v44;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
          break;
        v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
        *(_QWORD *)(a2 + v40) = v41 + 1;
        v22 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0)
          goto LABEL_64;
        v38 += 7;
        v14 = v39++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_66;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_66:
      v43 = 16;
LABEL_67:
      *(_DWORD *)(a1 + v43) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void MRMediaRemoteSetSystemAppPlaybackQueue(uint64_t a1, void *a2, void *a3)
{
  MRMediaRemoteSetSystemAppPlaybackQueueWithContext(a1, 0, 0, a2, a3);
}

void MRMediaRemoteSetSystemAppPlaybackQueueWithContext(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v9 = a4;
  v10 = a5;
  if (MRSystemAppPlaybackQueueGetType(a1) == 3 || !MRShouldUseLegacyMusicApplicationAsSystemMediaApp())
    v11 = CFSTR("(System Media Application)");
  else
    v11 = CFSTR("com.apple.LegacyMusic");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __MRMediaRemoteSetSystemAppPlaybackQueueWithContext_block_invoke;
  v13[3] = &unk_1E30CA948;
  v14 = v10;
  v12 = v10;
  MRMediaRemoteSetAppPlaybackQueueWithContext((uint64_t)v11, a1, a2, a3, v9, v13);

}

void MRMediaRemoteSetAppPlaybackQueueWithContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  MRPlayerPath *v13;
  MRClient *v14;

  v11 = a6;
  v12 = a5;
  v14 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]([MRClient alloc], "initWithProcessIdentifier:bundleIdentifier:", 0, a1);
  v13 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", a3, v14, 0);
  MRMediaRemoteSetAppPlaybackQueueForPlayer(a2, 0, v13, a4, v12, v11);

}

CFIndex _MRSendCommandReplyContainsSuccessfulStatus(CFIndex result)
{
  const __CFArray *v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  const __CFNumber *ValueAtIndex;
  BOOL v6;
  int valuePtr;

  if (result)
  {
    v1 = (const __CFArray *)result;
    result = CFArrayGetCount((CFArrayRef)result);
    valuePtr = 0;
    if (result)
    {
      v2 = result;
      v3 = 0;
      v4 = 1;
      do
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v1, v3);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
        result = valuePtr == 0;
        v3 = v4++;
        if (valuePtr)
          v6 = v2 > v3;
        else
          v6 = 0;
      }
      while (v6);
    }
  }
  return result;
}

void MRMediaRemoteSetAppPlaybackQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v9 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MRMediaRemoteSetAppPlaybackQueue_block_invoke;
  v11[3] = &unk_1E30CA948;
  v12 = v9;
  v10 = v9;
  MRMediaRemoteSetAppPlaybackQueueWithContext(a1, a2, a3, 0, a4, v11);

}

void MRMediaRemoteSetAppPlaybackQueueForPlayer(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  MRPlayerPath *v13;
  uint64_t v14;
  void *v15;
  void *ExternalRepresentation;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v11 = a5;
  v12 = a6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__50;
  v23 = __Block_byref_object_dispose__50;
  v24 = 0;
  v13 = (MRPlayerPath *)objc_msgSend(a3, "copy");
  if (!v13)
    v13 = objc_alloc_init(MRPlayerPath);
  -[MRPlayerPath origin](v13, "origin");

  if (a1)
  {
    if (a2)
    {
      v14 = objc_msgSend(a2, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(*MEMORY[0x1E0C9AE00], a1);
    if (ExternalRepresentation)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", ExternalRepresentation, CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData"));
    if (a4)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", a4, CFSTR("kMRMediaRemoteOptionContextID"));
    if (v20[5])
      -[MRPlayerPath setOrigin:](v13, "setOrigin:");
    MRMediaRemoteSendCommandToPlayer(122, v15, v13, 1, v11, v12);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __MRMediaRemoteSetAppPlaybackQueueForPlayer_block_invoke_2;
    block[3] = &unk_1E30C6770;
    v18 = v12;
    dispatch_async(v11, block);
    v15 = v18;
  }

  _Block_object_dispose(&v19, 8);
}

void sub_193A86878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MRMediaRemoteInsertSystemAppPlaybackQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  const __CFString *v10;
  id v11;

  v11 = a4;
  v9 = a5;
  if (MRSystemAppPlaybackQueueGetType(a1) == 3 || !MRShouldUseLegacyMusicApplicationAsSystemMediaApp())
    v10 = CFSTR("(System Media Application)");
  else
    v10 = CFSTR("com.apple.LegacyMusic");
  MRMediaRemoteInsertSystemAppPlaybackQueueForApp((uint64_t)v10, a1, a2, a3, v11, v9);

}

void MRMediaRemoteInsertSystemAppPlaybackQueueForApp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  MRPlayerPath *v13;
  MRClient *v14;

  v11 = a6;
  v12 = a5;
  v14 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]([MRClient alloc], "initWithProcessIdentifier:bundleIdentifier:", 0, a1);
  v13 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", a4, v14, 0);
  MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer(a2, a3, 0, v13, v12, v11);

}

void MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  MRPlayerPath *v13;
  MRClient *v14;

  v11 = a6;
  v12 = a5;
  v14 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]([MRClient alloc], "initWithProcessIdentifier:bundleIdentifier:", 0, CFSTR("(System Media Application)"));
  v13 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", a4, v14, 0);
  MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer(a1, a2, a3, v13, v12, v11);

}

void MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  uint64_t v12;
  id v13;
  void *ExternalRepresentation;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v11 = a6;
  v12 = *MEMORY[0x1E0C9AE00];
  v13 = a5;
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(v12, a1);
  v15 = (void *)objc_msgSend(a3, "mutableCopy");
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("kMRMediaRemoteOptionPlaybackQueueInsertionPosition"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", ExternalRepresentation, CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData"));
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer_block_invoke;
  v21[3] = &unk_1E30CA948;
  v22 = v11;
  v20 = v11;
  MRMediaRemoteSendCommandToPlayer(125, v18, a4, 1, v13, v21);

}

void MRMediaRemoteReportPlaybackError(__CFError *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  CFDataRef ErrorExternalRepresentation;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("kMRMediaRemotePlaybackErrorApplicationUserInfoKey"));
  if (a2)
    objc_msgSend(v7, "setObject:forKey:", a2, CFSTR("kMRMediaRemotePlaybackErrorReasonUserInfoKey"));
  if (a1)
  {
    ErrorExternalRepresentation = MRMediaRemoteCreateErrorExternalRepresentation(a1);
    if (ErrorExternalRepresentation)
      objc_msgSend(v7, "setObject:forKey:", ErrorExternalRepresentation, CFSTR("_kMRMediaRemotePlaybackErrorDataUserInfoKey"));

  }
  MRMediaRemotePostClientNotification(CFSTR("kMRMediaRemoteApplicationDidReportPlaybackErrorNotification"), v7);

}

void MRMediaRemoteSetWantsPlaybackErrorNotifications(int a1)
{
  void *v2;
  id v3;

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReceivesPlaybackErrorNotifications:", a1 != 0);

}

uint64_t _MRReceivedCommandProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  _MRCommandOptionsProtobuf *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  void *v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 80) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_56;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_58;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_56:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_58:
        v39 = 24;
        goto LABEL_63;
      case 2u:
        v24 = objc_alloc_init(_MRCommandOptionsProtobuf);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark() || (_MRCommandOptionsProtobufReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_70;
        goto LABEL_54;
      case 3u:
        v25 = 0;
        v26 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 80) |= 4u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_62:
        v39 = 48;
LABEL_63:
        *(_DWORD *)(a1 + v39) = v19;
        goto LABEL_68;
      case 4u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = 72;
        goto LABEL_48;
      case 5u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = 32;
        goto LABEL_48;
      case 6u:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        *(_BYTE *)(a1 + 80) |= 1u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v14 = v33++ >= 9;
              if (v14)
              {
                v34 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v34 = 0;
LABEL_67:
        *(_QWORD *)(a1 + 8) = v34;
        goto LABEL_68;
      case 7u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = 64;
LABEL_48:
        v38 = *(void **)(a1 + v31);
        *(_QWORD *)(a1 + v31) = v30;

        goto LABEL_68;
      case 8u:
        v24 = objc_alloc_init(_MRReceivedCommandAppOptionsProtobuf);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (_MRReceivedCommandAppOptionsProtobufReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_70;
        }
        goto LABEL_54;
      case 9u:
        v24 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
        objc_storeStrong((id *)(a1 + 56), v24);
        if (PBReaderPlaceMark()
          && _MRNowPlayingPlayerPathProtobufReadFrom((id *)&v24->super.super.isa, a2))
        {
LABEL_54:
          PBReaderRecallMark();

LABEL_68:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_70:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_68;
    }
  }
}

MRMutableTextEditingAttributes *MRTextEditingAttributesCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[MRTextEditingAttributes initWithTitle:prompt:]([MRMutableTextEditingAttributes alloc], "initWithTitle:prompt:", a2, a3);
}

double MRTextEditingAttributesGetInputTraits@<D0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  double result;

  if (a1)
  {
    objc_msgSend(a1, "inputTraits");
  }
  else
  {
    *(_QWORD *)(x8_0 + 128) = 0;
    result = 0.0;
    *(_OWORD *)(x8_0 + 96) = 0u;
    *(_OWORD *)(x8_0 + 112) = 0u;
    *(_OWORD *)(x8_0 + 64) = 0u;
    *(_OWORD *)(x8_0 + 80) = 0u;
    *(_OWORD *)(x8_0 + 32) = 0u;
    *(_OWORD *)(x8_0 + 48) = 0u;
    *(_OWORD *)x8_0 = 0u;
    *(_OWORD *)(x8_0 + 16) = 0u;
  }
  return result;
}

void MRTextEditingAttributesSetInputTraits(void *a1, uint64_t a2)
{
  id v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[8];
  uint64_t v9;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(_OWORD *)(a2 + 112);
    v8[6] = *(_OWORD *)(a2 + 96);
    v8[7] = v4;
    v9 = *(_QWORD *)(a2 + 128);
    v5 = *(_OWORD *)(a2 + 48);
    v8[2] = *(_OWORD *)(a2 + 32);
    v8[3] = v5;
    v6 = *(_OWORD *)(a2 + 80);
    v8[4] = *(_OWORD *)(a2 + 64);
    v8[5] = v6;
    v7 = *(_OWORD *)(a2 + 16);
    v8[0] = *(_OWORD *)a2;
    v8[1] = v7;
    objc_msgSend(v3, "setInputTraits:", v8);
  }

}

MRTextEditingSession *MRTextEditingSessionCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[MRTextEditingSession initWithText:attributes:]([MRTextEditingSession alloc], "initWithText:attributes:", a2, a3);
}

void sub_193A8F9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_193A8FD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193A90020(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

uint64_t _MRSetConnectionStateMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRPlaybackSessionMigrateRequestEventProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
          goto LABEL_39;
        case 2u:
          *(_BYTE *)(a1 + 56) |= 8u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v36 = 32;
          goto LABEL_50;
        case 3u:
          *(_BYTE *)(a1 + 56) |= 2u;
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v36 = 16;
          goto LABEL_50;
        case 4u:
          *(_BYTE *)(a1 + 56) |= 1u;
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v36 = 8;
LABEL_50:
          *(_QWORD *)(a1 + v36) = v23;
          continue;
        case 5u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *(_BYTE *)(a1 + 56) |= 4u;
          break;
        case 6u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_39:
          v35 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        v33 = v32 + 1;
        if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
          break;
        v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
        *(_QWORD *)(a2 + v31) = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0)
          goto LABEL_41;
        v28 += 7;
        v15 = v29++ >= 9;
        if (v15)
        {
          v30 = 0;
          goto LABEL_43;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
      if (*(_BYTE *)(a2 + *v5))
        v30 = 0;
LABEL_43:
      *(_QWORD *)(a1 + 24) = v30;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MROriginClientPropertiesMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v21;

      }
      else if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        *(_QWORD *)(a1 + 8) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRValueProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  void *v41;
  _MRValueProtobuf *v42;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_44;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 76) |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_54:
        *(_QWORD *)(a1 + 16) = v23;
        goto LABEL_63;
      case 3u:
        *(_BYTE *)(a1 + 76) |= 4u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        *(_DWORD *)(a1 + 56) = v30;
        goto LABEL_63;
      case 4u:
        *(_BYTE *)(a1 + 76) |= 1u;
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v33 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
          *(_QWORD *)(a2 + v31) = v32 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v33 = 0;
        }
        *(_QWORD *)(a1 + 8) = v33;
        goto LABEL_63;
      case 5u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_44;
      case 6u:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *(_BYTE *)(a1 + 76) |= 8u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                v36 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v36 = 0;
LABEL_58:
        *(_BYTE *)(a1 + 72) = v36 != 0;
        goto LABEL_63;
      case 7u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
LABEL_44:
        v41 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_63;
      case 8u:
        v42 = objc_alloc_init(_MRValueProtobuf);
        objc_msgSend((id)a1, "addArrayValue:", v42);
        if (!PBReaderPlaceMark() || (_MRValueProtobufReadFrom(v42, a2) & 1) == 0)
          goto LABEL_65;
        goto LABEL_50;
      case 9u:
        v42 = objc_alloc_init(_MRDictionaryProtobuf);
        objc_storeStrong((id *)(a1 + 48), v42);
        if (PBReaderPlaceMark() && (_MRDictionaryProtobufReadFrom(v42, a2) & 1) != 0)
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_63:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_65:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_63;
    }
  }
}

void sub_193A93C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193A94D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_193A9636C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

MRAVReconnaissanceSession *MRAVReconnaissanceSessionCreate(uint64_t a1)
{
  return -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", a1, 0, 8);
}

MRAVReconnaissanceSession *MRAVReconnaissanceSessionCreateWithMatchingOutputGroupID(uint64_t a1)
{
  return -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", 0, a1, 8);
}

MRAVReconnaissanceSession *MRAVReconnaissanceSessionCreateWithMatchingOutputGroupIDFeatures(uint64_t a1, uint64_t a2)
{
  return -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", 0, a1, a2);
}

MRAVReconnaissanceSession *MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs(uint64_t a1)
{
  MRAVReconnaissanceSession *v2;

  v2 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", 0, 0, 1);
  -[MRAVReconnaissanceSession setMatchingLogicalDeviceIDs:](v2, "setMatchingLogicalDeviceIDs:", a1);
  return v2;
}

MRAVReconnaissanceSession *MRAVReconnaissanceSessionCreateWithEndpointFeatures(uint64_t a1, uint64_t a2)
{
  return -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", a1, 0, a2);
}

uint64_t MRAVReconnaissanceSessionSetUseWeakMatching(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setUseWeakMatching:", a2);
}

uint64_t MRAVReconnaissanceSessionSetWaitForCompleteClusters(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setWaitForCompleteClusters:", a2);
}

uint64_t MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setShouldWaitForUnanimousEndpoints:", a2);
}

uint64_t MRAVReconnaissanceSessionSetReturnPartialResults(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setReturnPartialResults:", a2);
}

uint64_t MRAVReconnaissanceSessionSetExpectedLogicalDevices(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 176) = a2;
  return result;
}

void MRAVReconnaissanceSessionBeginSearch(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  if (v5)
  {
    v6 = a1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __MRAVReconnaissanceSessionBeginSearch_block_invoke;
    v8[3] = &unk_1E30CDBF0;
    v9 = v6;
    v10 = v5;
    v7 = v6;
    objc_msgSend(v7, "beginSearchWithTimeout:completion:", v8, a3);

  }
}

void MRAVReconnaissanceSessionBeginEndpointsSearch(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  if (v5)
  {
    v6 = a1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __MRAVReconnaissanceSessionBeginEndpointsSearch_block_invoke;
    v8[3] = &unk_1E30D0128;
    v9 = v6;
    v10 = v5;
    v7 = v6;
    objc_msgSend(v7, "beginSearchWithTimeout:endpointsCompletion:", v8, a3);

  }
}

void MRAVReconnaissanceSessionSetTargetAudioSessionID(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "discoverySession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetAudioSessionID:", a2);

}

void MRMediaRemoteSetWantsRouteChangeNotifications(int a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers;
  if (a1)
  {
    ++MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers;
    if (!v3)
    {
      v8 = v2;
      objc_msgSend(v2, "notificationClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 1;
LABEL_8:
      objc_msgSend(v4, "setReceivesRoutesChangedNotifications:", v6);

      v2 = v8;
    }
  }
  else
  {
    v7 = MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers == 1;
    if (MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers >= 1)
    {
      --MRMediaRemoteSetWantsRouteChangeNotifications___routeChangeNotificationObservers;
      if (v7)
      {
        v8 = v2;
        objc_msgSend(v2, "notificationClient");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = 0;
        goto LABEL_8;
      }
    }
  }

}

uint64_t MRMediaRemoteSetRouteDiscoveryMode(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetRouteDiscoveryMode(v2, a1);
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localOriginClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouteDiscoveryMode:", a1);

  return 1;
}

void MRMediaRemoteSetApplicationPickedRoutes(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetApplicationPickedRoutes(v2, a1, 0);
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localOriginClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationPickedRoutes:", a1);

}

void MRMediaRemoteSetNearbyDevice(void *a1)
{
  void *v2;

  v2 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetNearbyDevice(v2, a1, 0, 0);
}

void MRMediaRemoteCopyPickableRoutes_Async(void *a1, void *a2)
{
  MRMediaRemoteCopyPickableRoutesForCategory_Async(0, a1, a2);
}

void MRMediaRemoteCopyPickableRoutesForCategory_Async(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("queue must be non-nil"));
    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("handler must be non-nil"));
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke;
  v11[3] = &unk_1E30D0240;
  v12 = v5;
  v13 = v7;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v8, "fetchPickableRoutesWithCategory:completion:", a1, v11);

}

BOOL MRMediaRemoteSetPickedRouteWithPassword(uint64_t a1, void *a2)
{
  void *v4;

  v4 = (void *)MRGetSharedService();
  return MRMediaRemoteServiceSetPickedRoute(v4, a1, a2, 0);
}

BOOL MRMediaRemoteSetPickedRouteWithPasswordAndOptions(uint64_t a1, void *a2, unsigned int a3)
{
  void *v6;

  v6 = (void *)MRGetSharedService();
  return MRMediaRemoteServiceSetPickedRoute(v6, a1, a2, a3);
}

void MRMediaRemoteFindAndPickRoute(uint64_t a1, void *a2, unsigned int a3, void *a4, void *a5)
{
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *Error;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (a1)
  {
    v11 = (void *)MRGetSharedService();
    MRMediaRemoteServiceFindAndPickRoute(v11, a1, a2, a3, v13, v10);
  }
  else if (v9)
  {
    Error = (void *)MRMediaRemoteCreateError(2);
    ((void (**)(_QWORD, void *))v10)[2](v10, Error);

  }
}

void MRMediaRemoteGetPickedRouteHasVolumeControl(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v4 = a1;
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin((uint64_t)v5, v4, v3);

}

void MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MRMediaRemoteGetPickedRouteHasVolumeControlForOrigin_block_invoke;
  v7[3] = &unk_1E30CA878;
  v8 = v5;
  v6 = v5;
  MRMediaRemoteGetPickedRoutedVolumeControlCapabilities(a1, a2, v7);

}

int64_t MRMediaRemoteGetLocalVolumeControlCapabilities()
{
  MRPlayerPath *v0;
  void *v1;
  MRPlayerPath *v2;
  void *v3;
  int64_t PickedRouteVolumeControlCapabilitiesSync;

  v0 = [MRPlayerPath alloc];
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MRPlayerPath initWithOrigin:client:player:](v0, "initWithOrigin:client:player:", v1, 0, 0);

  v3 = (void *)MRGetSharedService();
  PickedRouteVolumeControlCapabilitiesSync = MRMediaRemoteServiceGetPickedRouteVolumeControlCapabilitiesSync(v3, v2, 0);

  return PickedRouteVolumeControlCapabilitiesSync;
}

void MRMediaRemoteSetPickedRouteVolumeControlCapabilities(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MRPlayerPath *v12;

  v7 = a4;
  v8 = a3;
  v12 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", a2, 0, 0);
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originClientForPlayerPath:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setVolumeCapabilities:", a1);
  v11 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetPickedRouteVolumeControlCapabilities(v11, v12, a1, v8, v7);

}

void MRMediaRemoteGetSavedAVRoutePassword(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRMediaRemoteGetSavedAVRoutePassword(CFStringRef, __strong dispatch_queue_t, void (^__strong)(CFStringRef))");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRAVRouting.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRMediaRemoteGetSavedAVRoutePassword(CFStringRef, __strong dispatch_queue_t, void (^__strong)(CFStringRef))");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MRAVRouting.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetSavedAVRoutePassword(v6, a1, v11, v5);

}

void MRMediaRemoteSetSavedAVRoutePassword(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = a3;
  v8 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetSavedAVRoutePassword(v8, a1, a2, v9, v7);

}

void MRMediaRemoteClearAllAVRoutePasswords()
{
  void *v0;

  v0 = (void *)MRGetSharedService();
  MRMediaRemoteServiceClearAllAVRoutePasswords(v0);
}

void MRMediaRemoteUnpickAirPlayAVRoutes(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = a1;
  v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceUnpickAirPlayAVRoutes(v4, v5, v3);

}

void MRMediaRemoteGetReceiverAirPlaySecuritySettings(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = a1;
  v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetReceiverAirPlaySecuritySettings(v4, v5, v3);

}

void MRMediaRemoteGetLocalDeviceIsGroupLeader(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __MRMediaRemoteGetLocalDeviceIsGroupLeader_block_invoke;
  v5[3] = &unk_1E30D02E0;
  v6 = v3;
  v4 = v3;
  MRMediaRemoteRequestIsGroupLeader(a1, v5);

}

void MRMediaRemoteSetMediaPlaybackVolume(unsigned int a1, void *a2, void *a3, float a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0CB37E8];
  v9 = a2;
  v10 = [v8 alloc];
  *(float *)&v11 = a4;
  v12 = (void *)objc_msgSend(v10, "initWithFloat:", v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("setMediaPlaybackVolume"), v15);
  v17 = v16;
  if (v12)
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), v12);
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v17;
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v19 = (void *)MRGetSharedService();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __MRMediaRemoteSetMediaPlaybackVolume_block_invoke;
  v23[3] = &unk_1E30D0330;
  v24 = v15;
  v25 = v13;
  v26 = v7;
  v20 = v7;
  v21 = v13;
  v22 = v15;
  MRMediaRemoteServiceSetMediaPlaybackVolume(v19, a1, v9, v23, a4);

}

void MRMediaRemoteAdjustMediaPlaybackVolumeWithAdjustment(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteServiceAdjustMediaPlaybackVolumeWithAdjustment(v9, a1, a2, v8, v7);

}

void MRMediaRemoteAdjustMediaPlaybackVolume(unsigned int a1, void *a2, void *a3, float a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0CB37E8];
  v9 = a2;
  v10 = [v8 alloc];
  *(float *)&v11 = a4;
  v12 = (void *)objc_msgSend(v10, "initWithFloat:", v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("adjustMediaPlaybackVolume"), v15);
  v17 = v16;
  if (v12)
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), v12);
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v17;
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v19 = (void *)MRGetSharedService();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __MRMediaRemoteAdjustMediaPlaybackVolume_block_invoke;
  v23[3] = &unk_1E30D0330;
  v24 = v15;
  v25 = v13;
  v26 = v7;
  v20 = v7;
  v21 = v13;
  v22 = v15;
  MRMediaRemoteServiceAdjustMediaPlaybackVolume(v19, a1, v9, v23, a4);

}

void MRMediaRemoteMuteSystemVolume(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a2;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBool:", a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("muteSystemVolume"), v11);
  v13 = v12;
  if (v8)
    objc_msgSend(v12, "appendFormat:", CFSTR(" for %@"), v8);
  _MRLogForCategory(0xAuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __MRMediaRemoteMuteSystemVolume_block_invoke;
  v20[3] = &unk_1E30C6878;
  v21 = v11;
  v22 = v9;
  v23 = v5;
  v17 = v5;
  v18 = v9;
  v19 = v11;
  MRMediaRemoteServiceSetSystemIsMuted(v16, a1, v7, v20);

}

CFStringRef MRMediaRemoteCopySetPickedRouteOptionsDescription(char a1)
{
  const __CFString *v1;

  if ((a1 & 1) != 0)
    v1 = CFSTR("IgnoreIncorrectPassword");
  else
    v1 = CFSTR("None");
  return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1);
}

void MRMediaRemoteRegisterPairingHandler(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceRegisterPairingHandler(v6, a1, v7, v5);

}

void MRMediaRemoteUnregisterPairingHandler(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceUnregisterPairingHandler(v6, a1, v7, v5);

}

void MRMediaRemoteCompletePairingHandler(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = a3;
  v8 = (void *)MRGetSharedService();
  MRMediaRemoteServiceCompletePairingHandler(v8, a1, a2, v9, v7);

}

uint64_t OUTLINED_FUNCTION_5_5(void *a1, const char *a2)
{
  uint64_t v2;

  return objc_msgSend(a1, "timeIntervalSinceDate:", *(_QWORD *)(v2 + 40));
}

void sub_193A98B0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A98D04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A99078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A990F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A99B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initAVAudioSession_3()
{
  Class result;

  if (AVFoundationLibrary_sOnce_13 != -1)
    dispatch_once(&AVFoundationLibrary_sOnce_13, &__block_literal_global_84_0);
  result = objc_getClass("AVAudioSession");
  classAVAudioSession_3 = (uint64_t)result;
  getAVAudioSessionClass_3[0] = (uint64_t (*)())AVAudioSessionFunction_3;
  return result;
}

id AVAudioSessionFunction_3()
{
  return (id)classAVAudioSession_3;
}

uint64_t _MRSendButtonEventMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 20) |= 4u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_51:
        *(_BYTE *)(a1 + 16) = v26 != 0;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v30 = 0;
          v31 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 20) |= 1u;
          while (1)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
              break;
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0)
              goto LABEL_53;
            v30 += 7;
            v14 = v31++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_55:
          v36 = 8;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 20) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_45;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_47:
          v36 = 12;
        }
        *(_DWORD *)(a1 + v36) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *MRApplicationActivityStatusCopyDescription(int a1)
{
  if ((a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E30D0500[a1 - 1];
}

MRMutableApplicationActivity *MRApplicationActivityCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[MRApplicationActivity initWithPrimaryAppDisplayID:secondaryAppDisplayID:]([MRMutableApplicationActivity alloc], "initWithPrimaryAppDisplayID:secondaryAppDisplayID:", a2, a3);
}

void MRApplicationActivityBegin(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = (void *)MRGetSharedService();
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originClientForOrigin:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setActivity:", a1);
  MRMediaRemoteServiceBeginActivity(v7, a1, v6, v5);

}

void MRApplicationActivityGetCurrentActivity(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = a1;
  v4 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetCurrentActivity(v4, v5, v3);

}

void MRApplicationActivityEnd(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  v6 = (void *)MRGetSharedService();
  MRMediaRemoteServiceEndActivity(v6, a1, v7, v5);

}

CFUUIDRef MRApplicationActivityCopyUniqueIdentifier(void *a1)
{
  void *v1;
  const __CFAllocator *v2;
  __CFString *v3;
  CFUUIDRef v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(v1, "UUIDString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CFUUIDCreateFromString(v2, v3);

  return v4;
}

uint64_t MRApplicationActivityCopyPrimaryAppDisplayID(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "primaryApplicationDisplayID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

uint64_t MRApplicationActivityCopySecondaryAppDisplayID(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "secondaryApplicationDisplayID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

uint64_t MRApplicationActivityShouldPrepareAppPlaybackQueue()
{
  return 0;
}

uint64_t _MRApplicationActivityCreateExternalRepresentation(uint64_t result)
{
  if (result)
  {
    MSVArchivedDataWithRootObject();
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

uint64_t _MRApplicationActivityCreateWithExternalRepresentation(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    v3 = objc_opt_class();
    objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MSVUnarchivedObjectOfClasses();
    v1 = objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void _MRApplicationActivitySetStatus(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setStatus:", a2);

}

uint64_t _MRAirPlayLeaderInfoProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRDeviceInfoMessageProtobuf *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRDeviceInfoMessageProtobuf);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_MRDeviceInfoMessageProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRSendVirtualTouchEventMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  _MRVirtualTouchEventProtobuf *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(_MRVirtualTouchEventProtobuf);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark() || (_MRVirtualTouchEventProtobufReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRRemoteTextInputMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v22;

      }
      else if ((_DWORD)v18 == 2)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0)
            goto LABEL_35;
          v24 += 7;
          v15 = v25++ >= 9;
          if (v15)
          {
            v26 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_37:
        *(_QWORD *)(a1 + 16) = v26;
      }
      else if ((_DWORD)v18 == 1)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_193A9D3AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_193A9D40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t MROriginCopy(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MROriginRef MROriginCopy(MROriginRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MROrigin_Deprecated.m"), 39, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

uint64_t MROriginCreateSkeletonFrom(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MROriginRef MROriginCreateSkeletonFrom(MROriginRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MROrigin_Deprecated.m"), 46, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  objc_msgSend(v1, "skeleton");
  v2 = objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MROriginEqualToOrigin(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean MROriginEqualToOrigin(MROriginRef, MROriginRef)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MROrigin_Deprecated.m"), 54, CFSTR("Type mismatch, expecting %@ found %@"), v9, objc_opt_class());

    if (!v4)
      goto LABEL_6;
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean MROriginEqualToOrigin(MROriginRef, MROriginRef)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MROrigin_Deprecated.m"), 55, CFSTR("Type mismatch, expecting %@ found %@"), v12, objc_opt_class());

  }
LABEL_6:
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t MROriginGetOriginType(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MROriginType MROriginGetOriginType(MROriginRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_class();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MROrigin_Deprecated.m"), 69, CFSTR("Type mismatch, expecting %@ found %@"), v6, objc_opt_class());

    }
  }
  v2 = objc_msgSend(v1, "type");

  return v2;
}

void MRMediaRemoteSetWantsOriginChangeNotifications(int a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers;
  if (a1)
  {
    ++MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers;
    if (!v3)
    {
      v8 = v2;
      objc_msgSend(v2, "notificationClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 1;
LABEL_8:
      objc_msgSend(v4, "setReceivesOriginChangedNotifications:", v6);

      v2 = v8;
    }
  }
  else
  {
    v7 = MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers == 1;
    if (MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers >= 1)
    {
      --MRMediaRemoteSetWantsOriginChangeNotifications___originChangeNotificationObservers;
      if (v7)
      {
        v8 = v2;
        objc_msgSend(v2, "notificationClient");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = 0;
        goto LABEL_8;
      }
    }
  }

}

void MRMediaRemoteGetAvailableOrigins(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v6 = a1;
  if (!v6)
  {
    v6 = (id)MEMORY[0x1E0C80D38];
    v3 = MEMORY[0x1E0C80D38];
  }
  v4 = a2;
  v5 = (void *)MRGetSharedService();
  MRMediaRemoteServiceGetAvailableOrigins(v5, v6, v4);

}

void MRMediaRemoteSetActiveOrigin(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v5 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
  }
  _MRLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = a1;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Setting active origin: %@", buf, 0xCu);
  }

  v9 = (void *)MRGetSharedService();
  MRMediaRemoteServiceSetActiveOrigin(v9, a1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MRMediaRemoteSetActiveOrigin_block_invoke;
  block[3] = &unk_1E30C6770;
  v12 = v6;
  v10 = v6;
  dispatch_async(v5, block);

}

void MRMediaRemoteGetActiveOrigin(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD, _QWORD, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    if (!v3)
    {
      v3 = (id)MEMORY[0x1E0C80D38];
      v5 = MEMORY[0x1E0C80D38];
    }
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __MRMediaRemoteGetActiveOrigin_block_invoke;
    v14[3] = &unk_1E30D0570;
    v3 = v3;
    v15 = v3;
    v16 = v4;
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v14);
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activePlayerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "origin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v7)[2](v7, 1, v10);
    }
    else
    {
      v11 = (void *)MRGetSharedService();
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __MRMediaRemoteGetActiveOrigin_block_invoke_3;
      v12[3] = &unk_1E30C8FE0;
      v13 = v7;
      MRMediaRemoteServiceGetActiveOrigin(v11, v3, v12);
      v10 = v13;
    }

  }
}

BOOL _MRAudioTimeProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 2u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v23 = &OBJC_IVAR____MRAudioTimeProtobuf__timestamp;
LABEL_32:
        *(_QWORD *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_33:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 24) |= 1u;
    v21 = *v3;
    v22 = *(_QWORD *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
      *(_QWORD *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v20 = 0;
    }
    v23 = &OBJC_IVAR____MRAudioTimeProtobuf__sampleRate;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRGroupSessionRemoveRequestProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRGameControllerPropertiesProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_51;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_53;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_53:
          v42 = 12;
          goto LABEL_62;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v24;

          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_57:
          v42 = 8;
          goto LABEL_62;
        case 4u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_61:
          v42 = 16;
LABEL_62:
          *(_DWORD *)(a1 + v42) = v19;
          continue;
        case 5u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
        *(_QWORD *)(a2 + v39) = v40 + 1;
        v38 |= (unint64_t)(v41 & 0x7F) << v36;
        if ((v41 & 0x80) == 0)
          goto LABEL_64;
        v36 += 7;
        v14 = v37++ >= 9;
        if (v14)
        {
          v38 = 0;
          goto LABEL_66;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
      if (*(_BYTE *)(a2 + *v5))
        v38 = 0;
LABEL_66:
      *(_BYTE *)(a1 + 32) = v38 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRAudioFormatSettingsProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_193AA12A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MRGroupSessionParticipantProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  _MRUserIdentityProtobuf *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  BOOL v39;
  uint64_t v40;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

        goto LABEL_59;
      case 2u:
        v20 = objc_alloc_init(_MRUserIdentityProtobuf);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (PBReaderPlaceMark() && (_MRUserIdentityProtobufReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_59:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_49:
        v39 = v23 != 0;
        v40 = 24;
        goto LABEL_58;
      case 4u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                v29 = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_53:
        v39 = v29 != 0;
        v40 = 25;
        goto LABEL_58;
      case 5u:
        v33 = 0;
        v34 = 0;
        v35 = 0;
        *(_BYTE *)(a1 + 28) |= 4u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (v14)
              {
                v35 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v35 = 0;
LABEL_57:
        v39 = v35 != 0;
        v40 = 26;
LABEL_58:
        *(_BYTE *)(a1 + v40) = v39;
        goto LABEL_59;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_59;
    }
  }
}

MRMutableVirtualVoiceInputDeviceDescriptor *MRVirtualVoiceInputDeviceDescriptorCreate()
{
  return objc_alloc_init(MRMutableVirtualVoiceInputDeviceDescriptor);
}

MRVirtualVoiceInputDeviceDescriptor *MRVirtualVoiceInputDeviceDescriptorCreateFromExternalRepresentation(uint64_t a1, uint64_t a2)
{
  return -[MRVirtualVoiceInputDeviceDescriptor initWithData:]([MRVirtualVoiceInputDeviceDescriptor alloc], "initWithData:", a2);
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCopySupportedFormats(void *a1)
{
  objc_msgSend(a1, "supportedFormats");
  return objc_claimAutoreleasedReturnValue();
}

uint64_t MRVirtualVoiceInputDeviceDescriptorSetSupportedFormats(void *a1, uint64_t a2)
{
  void *v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRVirtualVoiceInputDeviceDescriptorSetSupportedFormats(MRVirtualVoiceInputDeviceDescriptorRef, CFArrayRef)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MRVirtualVoiceInputDeviceDescriptor.m"), 143, CFSTR("unsupported type"));

  }
  return objc_msgSend(a1, "setSupportedFormats:", a2);
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCopyDefaultFormat(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "defaultFormat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

uint64_t MRVirtualVoiceInputDeviceDescriptorSetDefaultAudioFormat(void *a1, uint64_t a2)
{
  void *v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRVirtualVoiceInputDeviceDescriptorSetDefaultAudioFormat(MRVirtualVoiceInputDeviceDescriptorRef, CFDictionaryRef)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MRVirtualVoiceInputDeviceDescriptor.m"), 154, CFSTR("unsupported type"));

  }
  return objc_msgSend(a1, "setDefaultFormat:", a2);
}

uint64_t MRVirtualVoiceInputDeviceDescriptorCreateExternalRepresentation(void *a1)
{
  objc_msgSend(a1, "data");
  return objc_claimAutoreleasedReturnValue();
}

BOOL _MRColorProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 24) |= 8u;
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v19);
            *(_QWORD *)(a2 + v18) = v19 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR____MRColorProtobuf__red;
          goto LABEL_41;
        case 2u:
          *(_BYTE *)(a1 + 24) |= 4u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR____MRColorProtobuf__green;
          goto LABEL_41;
        case 3u:
          *(_BYTE *)(a1 + 24) |= 2u;
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR____MRColorProtobuf__blue;
          goto LABEL_41;
        case 4u:
          *(_BYTE *)(a1 + 24) |= 1u;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR____MRColorProtobuf__alpha;
LABEL_41:
          *(_DWORD *)(a1 + *v27) = v20;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MRSetHiliteModeMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL _MRSetReadyStateMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t _MRAVModifyOutputContextRequestProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  _MRGroupTopologyModificationRequestProtobuf *v24;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 72) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_47;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_49;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_49:
        *(_DWORD *)(a1 + 40) = v19;
        goto LABEL_44;
      case 2u:
        PBReaderReadString();
        v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addAddingOutputDeviceUID:", v24);
        goto LABEL_43;
      case 3u:
        PBReaderReadString();
        v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addRemovingOutputDeviceUID:", v24);
        goto LABEL_43;
      case 4u:
        PBReaderReadString();
        v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addSettingOutputDeviceUID:", v24);
        goto LABEL_43;
      case 5u:
        PBReaderReadString();
        v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addClusterAwareAddingOutputDeviceUID:", v24);
        goto LABEL_43;
      case 6u:
        PBReaderReadString();
        v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addClusterAwareRemovingOutputDeviceUID:", v24);
        goto LABEL_43;
      case 7u:
        PBReaderReadString();
        v24 = (_MRGroupTopologyModificationRequestProtobuf *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addClusterAwareSettingOutputDeviceUID:", v24);
        goto LABEL_43;
      case 8u:
        v24 = objc_alloc_init(_MRGroupTopologyModificationRequestProtobuf);
        objc_storeStrong((id *)(a1 + 56), v24);
        if (PBReaderPlaceMark()
          && (_MRGroupTopologyModificationRequestProtobufReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

BOOL _MRGameControllerButtonsProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v21;
  uint64_t v23;
  unint64_t v24;
  int v25;
  int *v26;
  int *v27;
  uint64_t v28;
  int *v29;
  int *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int *v61;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = &OBJC_IVAR___MRNowPlayingPlayerClientCallbacks__createItemForIdentifierCallbacks;
    v9 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__dPadX;
    v10 = (int *)MEMORY[0x1E0D82BB8];
    v11 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__dPadY;
    v12 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__a;
    while (1)
    {
      if (*(_BYTE *)(a2 + *v6))
        return *(_BYTE *)(a2 + *v6) == 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v4;
        v17 = *(_QWORD *)(a2 + v16);
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)(a2 + *v5))
          break;
        v19 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v17);
        *(_QWORD *)(a2 + v16) = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_12;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          v21 = *(unsigned __int8 *)(a2 + *v6);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
      v21 = *(unsigned __int8 *)(a2 + *v6);
      if (*(_BYTE *)(a2 + *v6))
        v15 = 0;
LABEL_14:
      if (v21 || (v15 & 7) == 4)
        return *(_BYTE *)(a2 + *v6) == 0;
      switch((v15 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + v8[965]) |= 4u;
          v23 = *v4;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = v9;
          goto LABEL_96;
        case 2u:
          *(_WORD *)(a1 + v8[965]) |= 8u;
          v33 = *v4;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = v11;
          goto LABEL_96;
        case 3u:
          *(_WORD *)(a1 + v8[965]) |= 1u;
          v35 = *v4;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = v12;
          goto LABEL_96;
        case 4u:
          *(_WORD *)(a1 + v8[965]) |= 2u;
          v37 = *v4;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFFBLL && v38 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__b;
          goto LABEL_96;
        case 5u:
          *(_WORD *)(a1 + v8[965]) |= 0x2000u;
          v39 = *v4;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__x;
          goto LABEL_96;
        case 6u:
          *(_WORD *)(a1 + v8[965]) |= 0x4000u;
          v41 = *v4;
          v42 = *(_QWORD *)(a2 + v41);
          if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v42);
            *(_QWORD *)(a2 + v41) = v42 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__y;
          goto LABEL_96;
        case 7u:
          *(_WORD *)(a1 + v8[965]) |= 0x10u;
          v43 = *v4;
          v44 = *(_QWORD *)(a2 + v43);
          if (v44 <= 0xFFFFFFFFFFFFFFFBLL && v44 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v44);
            *(_QWORD *)(a2 + v43) = v44 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftShoulder;
          goto LABEL_96;
        case 8u:
          *(_WORD *)(a1 + v8[965]) |= 0x200u;
          v45 = *v4;
          v46 = *(_QWORD *)(a2 + v45);
          if (v46 <= 0xFFFFFFFFFFFFFFFBLL && v46 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v46);
            *(_QWORD *)(a2 + v45) = v46 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightShoulder;
          goto LABEL_96;
        case 9u:
          *(_WORD *)(a1 + v8[965]) |= 0x20u;
          v47 = *v4;
          v48 = *(_QWORD *)(a2 + v47);
          if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftThumbstickX;
          goto LABEL_96;
        case 0xAu:
          *(_WORD *)(a1 + v8[965]) |= 0x40u;
          v49 = *v4;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 <= 0xFFFFFFFFFFFFFFFBLL && v50 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftThumbstickY;
          goto LABEL_96;
        case 0xBu:
          *(_WORD *)(a1 + v8[965]) |= 0x400u;
          v51 = *v4;
          v52 = *(_QWORD *)(a2 + v51);
          if (v52 <= 0xFFFFFFFFFFFFFFFBLL && v52 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v52);
            *(_QWORD *)(a2 + v51) = v52 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightThumbstickX;
          goto LABEL_96;
        case 0xCu:
          *(_WORD *)(a1 + v8[965]) |= 0x800u;
          v53 = *v4;
          v54 = *(_QWORD *)(a2 + v53);
          if (v54 <= 0xFFFFFFFFFFFFFFFBLL && v54 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v54);
            *(_QWORD *)(a2 + v53) = v54 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightThumbstickY;
          goto LABEL_96;
        case 0xDu:
          *(_WORD *)(a1 + v8[965]) |= 0x80u;
          v55 = *v4;
          v56 = *(_QWORD *)(a2 + v55);
          if (v56 <= 0xFFFFFFFFFFFFFFFBLL && v56 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v56);
            *(_QWORD *)(a2 + v55) = v56 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__leftTrigger;
          goto LABEL_96;
        case 0xEu:
          *(_WORD *)(a1 + v8[965]) |= 0x1000u;
          v57 = *v4;
          v58 = *(_QWORD *)(a2 + v57);
          if (v58 <= 0xFFFFFFFFFFFFFFFBLL && v58 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v58);
            *(_QWORD *)(a2 + v57) = v58 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__rightTrigger;
          goto LABEL_96;
        case 0xFu:
          *(_WORD *)(a1 + v8[965]) |= 0x100u;
          v59 = *v4;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 <= 0xFFFFFFFFFFFFFFFBLL && v60 + 4 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v10) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v61 = &OBJC_IVAR____MRGameControllerButtonsProtobuf__pause;
LABEL_96:
          *(_DWORD *)(a1 + *v61) = v25;
          goto LABEL_97;
        default:
          v26 = v9;
          v27 = v11;
          v28 = v2;
          v29 = v8;
          v30 = v12;
          v31 = a1;
          v32 = PBReaderSkipValueWithTag();
          a1 = v31;
          v6 = (int *)MEMORY[0x1E0D82BC8];
          v12 = v30;
          v8 = v29;
          v2 = v28;
          v11 = v27;
          v9 = v26;
          if ((v32 & 1) == 0)
            return 0;
LABEL_97:
          if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
            return *(_BYTE *)(a2 + *v6) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v6) == 0;
}

BOOL _MRPlaybackSessionRequestMessageProtobufReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MRPlaybackSessionRequestProtobuf *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(_MRPlaybackSessionRequestProtobuf);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (_MRPlaybackSessionRequestProtobufReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !_MRNowPlayingPlayerPathProtobufReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void _MRLogForCategory_cold_1()
{
  __assert_rtn("_MRLogForCategory", "MRLog.m", 38, "category < MRLoggingCategoryCOUNT");
}

void MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "[MRNowPlaying] Ignoring setPlaybackState because application does not contain entitlement %@ for platform", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void MRMediaRemoteGetMediaAppIsInstalled_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[MRNowPlaying] Disallowed bundle ID requested for installation status: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void MRMediaRemoteRequestPendingCommands_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_193827000, a1, a3, "Cannot call 'RequestPendingCommands' if CanBeNowPlaying=YES", a5, a6, a7, a8, 0);
}

void MRMediaRemoteCopyPendingCommands_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_193827000, a1, a3, "Cannot call 'CopyPendingCommands' if tCanBeNowPlaying=YES", a5, a6, a7, a8, 0);
}

#error "193AAAE10: call analysis failed (funcsize=31)"

void MRMediaRemoteValidateIncomingCommandOptions_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[MRRemoteControl] Command %{public}@ missing source position option(s): %{public}@", (uint8_t *)&v3, 0x16u);
}

void MRAddDistantEndpointToXPCMessage_cold_1()
{
  __assert_rtn("MRAddDistantEndpointToXPCMessage", "MRSerializationUtility.m", 76, "[endpoint isKindOfClass:[MRAVDistantEndpoint class]]");
}

void MRAddPropertyListToXPCMessage_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_193827000, v1, OS_LOG_TYPE_ERROR, "Error encoding to XPC message: %@ object: %@", v2, 0x16u);
  OUTLINED_FUNCTION_8();
}

void MRCreatePropertyListFromXPCMessage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "Error decoding XPC message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void _MRDecodeObjectForKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "Decode Error: could not decode %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void _MREncodeObjectForKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "Encode Error: could not encode %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void MRCreateDecodedUserInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "Decode Error: could not decode %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void MRCreateDecodedUserInfo_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "Decode Error: could not decode %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void MRCreateDecodedUserInfo_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a1, a3, "Decode Error: could not decode %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void MRMediaRemoteSetNowPlayingInfoForPlayer_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[NowPlayingInfo] Ignoring nowPlayingInfo update because playback queue callbacks are set", v1, 2u);
}

void MRMediaRemoteSetNowPlayingInfoForPlayer_cold_2(char a1, void *a2, NSObject *a3)
{
  const __CFString *v4;
  __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
    v4 = CFSTR("Replace");
  else
    v4 = CFSTR("Update");
  v5 = (__CFString *)MRMediaRemoteCopyReadableDictionaryDescription(a2);
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_193827000, a3, OS_LOG_TYPE_DEBUG, "[NowPlayingInfo] Attempting to set nowPlayingInfo with mergePolicy %@: %@", (uint8_t *)&v6, 0x16u);

}

void MRSystemAppPlaybackQueueDestroy_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueDestroy", "MRRemotePlaybackQueue.m", 154, "queue");
}

void MRSystemAppPlaybackQueueGetType_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetType", "MRRemotePlaybackQueue.m", 281, "queue");
}

void MRSystemAppPlaybackQueueIsRequestingImmediatePlayback_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueIsRequestingImmediatePlayback", "MRRemotePlaybackQueue.m", 287, "queue");
}

void MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_9("MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback", "MRRemotePlaybackQueue.m", a3, "queue");
}

void MRSystemAppPlaybackQueueGetSiriRecommendationIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetSiriRecommendationIdentifier", "MRRemotePlaybackQueue.m", 299, "queue");
}

void MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier", "MRRemotePlaybackQueue.m", 305, "queue");
}

void MRSystemAppPlaybackQueueGetSiriAssetInfo_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetSiriAssetInfo", "MRRemotePlaybackQueue.m", 318, "queue");
}

void MRSystemAppPlaybackQueueSetSiriAssetInfo_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetSiriAssetInfo", "MRRemotePlaybackQueue.m", 324, "queue");
}

void MRSystemAppPlaybackQueueCopyFeatureName_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyFeatureName", "MRRemotePlaybackQueue.m", 337, "queue");
}

void MRSystemAppPlaybackQueueSetFeatureName_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetFeatureName", "MRRemotePlaybackQueue.m", 343, "queue");
}

void MRSystemAppPlaybackQueueGetSiriWHAMetricsInfo_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetSiriWHAMetricsInfo", "MRRemotePlaybackQueue.m", 355, "queue");
}

void MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo", "MRRemotePlaybackQueue.m", 360, "queue");
}

void MRSystemAppPlaybackQueueShouldOverrideManuallyCuratedQueue_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetReplaceIntent", "MRRemotePlaybackQueue.m", 383, "queue");
}

void MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_4("MRSystemAppPlaybackQueueSetReplaceIntent", "MRRemotePlaybackQueue.m", a3, "queue");
}

void MRSystemAppPlaybackQueueGetUserInfo_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetUserInfo", "MRRemotePlaybackQueue.m", 395, "queue");
}

void MRSystemAppPlaybackQueueSetUserInfo_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetUserInfo", "MRRemotePlaybackQueue.m", 401, "queue");
}

void MRSystemAppPlaybackQueueGetLocalQueryData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryData", "MRRemotePlaybackQueue.m", 416, "queue");
}

void MRSystemAppPlaybackQueueGetLocalQueryData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryData", "MRRemotePlaybackQueue.m", 417, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryData", "MRRemotePlaybackQueue.m", 423, "queue");
}

void MRSystemAppPlaybackQueueSetLocalQueryData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryData", "MRRemotePlaybackQueue.m", 424, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData", "MRRemotePlaybackQueue.m", 440, "queue");
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData", "MRRemotePlaybackQueue.m", 441, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData", "MRRemotePlaybackQueue.m", 447, "queue");
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData", "MRRemotePlaybackQueue.m", 448, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID", "MRRemotePlaybackQueue.m", 464, "queue");
}

void MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID", "MRRemotePlaybackQueue.m", 465, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID", "MRRemotePlaybackQueue.m", 471, "queue");
}

void MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID", "MRRemotePlaybackQueue.m", 472, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryShuffleMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryShuffleMode", "MRRemotePlaybackQueue.m", 478, "queue");
}

void MRSystemAppPlaybackQueueGetLocalQueryShuffleMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryShuffleMode", "MRRemotePlaybackQueue.m", 479, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryShuffleMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryShuffleMode", "MRRemotePlaybackQueue.m", 485, "queue");
}

void MRSystemAppPlaybackQueueSetLocalQueryShuffleMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryShuffleMode", "MRRemotePlaybackQueue.m", 486, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueGetLocalQueryRepeatMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryRepeatMode", "MRRemotePlaybackQueue.m", 492, "queue");
}

void MRSystemAppPlaybackQueueGetLocalQueryRepeatMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetLocalQueryRepeatMode", "MRRemotePlaybackQueue.m", 493, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetLocalQueryRepeatMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryRepeatMode", "MRRemotePlaybackQueue.m", 499, "queue");
}

void MRSystemAppPlaybackQueueSetLocalQueryRepeatMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetLocalQueryRepeatMode", "MRRemotePlaybackQueue.m", 500, "queue->type == MRSystemAppPlaybackQueueTypeLocalMediaQuery");
}

void MRSystemAppPlaybackQueueSetRadioStationIDType_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIDType", "MRRemotePlaybackQueue.m", 517, "queue");
}

void MRSystemAppPlaybackQueueSetRadioStationIDType_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIDType", "MRRemotePlaybackQueue.m", 518, "queue->type == MRSystemAppPlaybackQueueTypeRadioStation");
}

void MRSystemAppPlaybackQueueGetRadioStationIntegerPID_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetRadioStationIntegerPID", "MRRemotePlaybackQueue.m", 533, "queue");
}

void MRSystemAppPlaybackQueueSetRadioStationIntegerPID_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIntegerPID", "MRRemotePlaybackQueue.m", 546, "queue");
}

void MRSystemAppPlaybackQueueSetRadioStationIntegerPID_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIntegerPID", "MRRemotePlaybackQueue.m", 548, "queue->radioStationQueue.stationIDType == MRSystemAppRadioStationIDTypeIntegerPID");
}

void MRSystemAppPlaybackQueueSetRadioStationIntegerPID_cold_3()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationIntegerPID", "MRRemotePlaybackQueue.m", 547, "queue->type == MRSystemAppPlaybackQueueTypeRadioStation");
}

void MRSystemAppPlaybackQueueSetRadioStationStringIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationStringIdentifier", "MRRemotePlaybackQueue.m", 574, "queue");
}

void MRSystemAppPlaybackQueueSetRadioStationStringIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationStringIdentifier", "MRRemotePlaybackQueue.m", 576, "queue->radioStationQueue.stationIDType == MRSystemAppRadioStationIDTypeStationStringID");
}

void MRSystemAppPlaybackQueueSetRadioStationStringIdentifier_cold_3()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetRadioStationStringIdentifier", "MRRemotePlaybackQueue.m", 575, "queue->type == MRSystemAppPlaybackQueueTypeRadioStation");
}

void MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers", "MRRemotePlaybackQueue.m", 603, "queue");
}

void MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyGenericTrackIdentifiers", "MRRemotePlaybackQueue.m", 604, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueSetGenericTrackIdentifiers_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetGenericTrackIdentifiers", "MRRemotePlaybackQueue.m", 616, "queue");
}

void MRSystemAppPlaybackQueueSetGenericTrackIdentifiers_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetGenericTrackIdentifiers", "MRRemotePlaybackQueue.m", 617, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier", "MRRemotePlaybackQueue.m", 631, "queue");
}

void MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetFirstItemGenericTrackIdentifier", "MRRemotePlaybackQueue.m", 632, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueSetFirstItemGenericTrackIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetFirstItemGenericTrackIdentifier", "MRRemotePlaybackQueue.m", 639, "queue");
}

void MRSystemAppPlaybackQueueSetFirstItemGenericTrackIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetFirstItemGenericTrackIdentifier", "MRRemotePlaybackQueue.m", 640, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueGetTracklistShuffleMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetTracklistShuffleMode", "MRRemotePlaybackQueue.m", 656, "queue");
}

void MRSystemAppPlaybackQueueGetTracklistShuffleMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetTracklistShuffleMode", "MRRemotePlaybackQueue.m", 657, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueSetTracklistShuffleMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetTracklistShuffleMode", "MRRemotePlaybackQueue.m", 663, "queue");
}

void MRSystemAppPlaybackQueueSetTracklistShuffleMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetTracklistShuffleMode", "MRRemotePlaybackQueue.m", 664, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueGetTracklistRepeatMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetTracklistRepeatMode", "MRRemotePlaybackQueue.m", 670, "queue");
}

void MRSystemAppPlaybackQueueGetTracklistRepeatMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetTracklistRepeatMode", "MRRemotePlaybackQueue.m", 671, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueSetTracklistRepeatMode_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetTracklistRepeatMode", "MRRemotePlaybackQueue.m", 677, "queue");
}

void MRSystemAppPlaybackQueueSetTracklistRepeatMode_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetTracklistRepeatMode", "MRRemotePlaybackQueue.m", 678, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData", "MRRemotePlaybackQueue.m", 684, "queue");
}

void MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueGetTracklistCollectionIdentifierSetData", "MRRemotePlaybackQueue.m", 685, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData", "MRRemotePlaybackQueue.m", 691, "queue");
}

void MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData", "MRRemotePlaybackQueue.m", 692, "_MRSystemAppPlaybackQueueTypeIsTracklistType(queue->type)");
}

void MRSystemAppPlaybackQueueCopyGeniusSeedTrack_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyGeniusSeedTrack", "MRRemotePlaybackQueue.m", 706, "queue");
}

void MRSystemAppPlaybackQueueCopyGeniusSeedTrack_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyGeniusSeedTrack", "MRRemotePlaybackQueue.m", 707, "queue->type == MRSystemAppPlaybackQueueTypeGenius");
}

void MRSystemAppPlaybackQueueSetGeniusSeedTrack_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetGeniusSeedTrack", "MRRemotePlaybackQueue.m", 720, "queue");
}

void MRSystemAppPlaybackQueueSetGeniusSeedTrack_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetGeniusSeedTrack", "MRRemotePlaybackQueue.m", 721, "queue->type == MRSystemAppPlaybackQueueTypeGenius");
}

void MRSystemAppPlaybackQueueCopyCustomDataIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyCustomDataIdentifier", "MRRemotePlaybackQueue.m", 735, "queue");
}

void MRSystemAppPlaybackQueueCopyCustomDataIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyCustomDataIdentifier", "MRRemotePlaybackQueue.m", 736, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRSystemAppPlaybackQueueSetCustomDataIdentifier_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetCustomDataIdentifier", "MRRemotePlaybackQueue.m", 743, "queue");
}

void MRSystemAppPlaybackQueueSetCustomDataIdentifier_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetCustomDataIdentifier", "MRRemotePlaybackQueue.m", 744, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRSystemAppPlaybackQueueCopyCustomData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyCustomData", "MRRemotePlaybackQueue.m", 755, "queue");
}

void MRSystemAppPlaybackQueueCopyCustomData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueCopyCustomData", "MRRemotePlaybackQueue.m", 756, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRSystemAppPlaybackQueueSetCustomData_cold_1()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetCustomData", "MRRemotePlaybackQueue.m", 763, "queue");
}

void MRSystemAppPlaybackQueueSetCustomData_cold_2()
{
  __assert_rtn("MRSystemAppPlaybackQueueSetCustomData", "MRRemotePlaybackQueue.m", 764, "queue->type == MRSystemAppPlaybackQueueTypeCustom");
}

void MRAVEndpointModifyOutputDevicesInGroup_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[AVEndpoint] Failed to select playback category on auxiliary context. %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void _MRMediaRemoteLogUnsubscribedContentItems_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(a2, 0);
  v6 = 138543618;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_193827000, a3, OS_LOG_TYPE_DEBUG, "Not sending contentItemChange for path %{public}@ %@", (uint8_t *)&v6, 0x16u);

}

void _MRReadNowPlayingInfoString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_193827000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void _MRReadNowPlayingInfoString_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void _MRMediaRemoteGetDeviceUIDWithRetryIntervals_cold_1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[GetDeviceUIDWithRetry] Unable to fetch required deviceUID after %lu retries", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_6();
}

#error "193AAEE84: call analysis failed (funcsize=31)"

#error "193AAEF38: call analysis failed (funcsize=43)"

#error "193AAF0B4: call analysis failed (funcsize=41)"

#error "193AAF224: call analysis failed (funcsize=34)"

#error "193AAF304: call analysis failed (funcsize=33)"

#error "193AAF3C4: call analysis failed (funcsize=47)"

#error "193AAF474: call analysis failed (funcsize=42)"

void MRContentItemMerge_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_193827000, a2, OS_LOG_TYPE_DEBUG, "Attempting to Merge a ContentItem with itself %@", (uint8_t *)&v2, 0xCu);
}

void _onQueue_MRInvokeClientCallbacks_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = OUTLINED_FUNCTION_1_9(a1, a2);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_13(&dword_193827000, a3, v5, "[MRPlaybackQueueServiceClient] playbackQueueRequest %{public}@ requesting assets for item %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

void _MRHandlePlaybackQueueRequest_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_0_13(&dword_193827000, a3, (uint64_t)a3, "[MRPlaybackQueueServiceClient] Received playbackQueueRequest %{public}@ for path %{public}@", (uint8_t *)&v3);
}

#error "193AB1128: call analysis failed (funcsize=39)"

#error "193AB11CC: call analysis failed (funcsize=39)"

#error "193AB125C: call analysis failed (funcsize=33)"

#error "193AB12EC: call analysis failed (funcsize=33)"

#error "193AB137C: call analysis failed (funcsize=33)"

#error "193AB140C: call analysis failed (funcsize=33)"

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x1E0D01110]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1E0C98AF0](plist, format);
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C98B28](stream, propertyName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1E0C99478](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1E0CBB038]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MSVArchivedDataWithRootObject()
{
  return MEMORY[0x1E0D4CE18]();
}

uint64_t MSVCopyLocalizedModelName()
{
  return MEMORY[0x1E0D4CE60]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1E0D4CE70]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1E0D4CE78]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1E0D4CE98]();
}

uint64_t MSVImageUtilitiesMakeBoundingBoxSize()
{
  return MEMORY[0x1E0D4CF40]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x1E0D4CF60]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1E0D4CF68]();
}

uint64_t MSVPropertyListDataClasses()
{
  return MEMORY[0x1E0D4CF80]();
}

uint64_t MSVUnarchivedObjectOfClass()
{
  return MEMORY[0x1E0D4CFD0]();
}

uint64_t MSVUnarchivedObjectOfClasses()
{
  return MEMORY[0x1E0D4CFD8]();
}

uint64_t MSVWeakLinkClass()
{
  return MEMORY[0x1E0D4CFE0]();
}

uint64_t MSVWeakLinkSymbol()
{
  return MEMORY[0x1E0D4CFE8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1E0D82DA0]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1E0D82DA8]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1E0D82DB0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1E0D82DB8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1E0D82DC0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1E0D82DC8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x1E0D82DD0]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x1E0D82E80]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x1E0D82E88]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x1E0D82E90]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x1E0D82E98]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x1E0D82EA0]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x1E0D82EA8]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x1E0D82EB0]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1E0D1B798]();
}

uint64_t _AXSHapticMusicEnabled()
{
  return MEMORY[0x1E0DDD7C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1E0C9A878]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1E0C9A880]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x1E0C83B50](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x1E0C83B90](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

uint64_t msv_dispatch_async_on_queue()
{
  return MEMORY[0x1E0D4D138]();
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x1E0D4D148]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FF0](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

