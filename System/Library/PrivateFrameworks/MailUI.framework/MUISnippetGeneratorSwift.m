@implementation MUISnippetGeneratorSwift

+ (id)highlightingTokens:(id)a3 attributedString:(id)a4 highlighting:(id)a5 error:(id *)a6
{
  id v6;
  id v7;
  void *v9;
  const void *v12;
  uint64_t v14;
  _BYTE v15[16];
  const void *v16;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  v12 = _Block_copy(a5);
  v14 = sub_1D565FF90();
  v16 = v12;
  swift_getObjCClassMetadata();
  v9 = (void *)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(v14, a4, (uint64_t)sub_1D5652194, (uint64_t)v15);
  _Block_release(v12);
  swift_bridgeObjectRelease();

  return v9;
}

+ (id)highlightingAuthorTokens:(id)a3 authorEmailTokens:(id)a4 inEmailAttributedString:(id)a5 highlighting:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  id v9;
  void *v11;
  const void *v15;
  uint64_t v16;
  uint64_t v18;
  _BYTE v19[16];
  const void *v20;

  swift_getObjCClassMetadata();
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = _Block_copy(a6);
  v18 = sub_1D565FF90();
  v16 = sub_1D565FF90();
  v20 = v15;
  swift_getObjCClassMetadata();
  v11 = (void *)static SnippetGenerator.highlightingTokens(authorTokens:authorEmailTokens:inEmailAttributedString:highlighting:)(v18, v16, a5, (uint64_t)sub_1D5652194, (uint64_t)v19);
  _Block_release(v15);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v11;
}

+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 maxNumberOfWordsBeforeOrAfterToken:(int64_t)a5 maxNumberOfRanges:(int64_t)a6 highlighting:(id)a7 error:(id *)a8
{
  id v8;
  id v9;
  void *v11;
  const void *v14;
  uint64_t v18;
  _BYTE v19[16];
  const void *v20;

  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = a4;
  v14 = _Block_copy(a7);
  v18 = sub_1D565FF90();
  v20 = v14;
  swift_getObjCClassMetadata();
  v11 = (void *)static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:maxNumberOfWordsBeforeOrAfterToken:maxNumberOfRanges:highlighting:)(v18, a4, a5, a6, (uint64_t)sub_1D5652194, (uint64_t)v19);
  _Block_release(v14);
  swift_bridgeObjectRelease();

  return v11;
}

+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 frame:(CGRect)a5 highlighting:(id)a6 error:(id *)a7
{
  id v7;
  id v8;
  _QWORD *v10;
  const void *v13;
  uint64_t v16;
  _BYTE v17[16];
  const void *v18;
  CGRect v19;

  v19 = a5;
  swift_getObjCClassMetadata();
  v7 = a3;
  v8 = a4;
  v13 = _Block_copy(a6);
  v16 = sub_1D565FF90();
  v18 = v13;
  swift_getObjCClassMetadata();
  v10 = static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:inside:highlighting:)(v16, a4, (uint64_t)sub_1D5652194, (uint64_t)v17, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  _Block_release(v13);
  swift_bridgeObjectRelease();

  return v10;
}

- (MUISnippetGeneratorSwift)init
{
  return (MUISnippetGeneratorSwift *)SnippetGenerator.init()();
}

@end
