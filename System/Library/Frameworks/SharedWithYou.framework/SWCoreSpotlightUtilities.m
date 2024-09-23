@implementation SWCoreSpotlightUtilities

+ (id)requiredSpotlightAttributeKeysForFiles
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8848], "requiredSpotlightAttributeKeysForFiles");
}

+ (id)requiredSpotlightAttributeKeysForLinks
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8848], "requiredSpotlightAttributeKeysForLinks");
}

+ (id)fetchCSSearchableItemForUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 withRequiredAttributes:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v9 = (void *)MEMORY[0x1E0DA8848];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "fetchCSSearchableItemForUniqueIdentifier:forContentType:withRequiredAttributes:error:", v11, +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v7), v10, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)CSSearchQueryContextForAutodonatingChats
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8848], "CSSearchQueryContextForAutodonatingChats");
}

+ (id)CSQueryStringForAutodonatingChatsWithDecay:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8848], "CSQueryStringForAutodonatingChatsWithDecay:", a3);
}

+ (id)CSSearchQueryContextForSLHighlightsForContentType:(unsigned __int8)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8848], "CSSearchQueryContextForSLHighlightsForContentType:", +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", a3));
}

+ (id)CSQueryStringForSLHighlightsForContentType:(unsigned __int8)a3 forChatIdentifiers:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DA8848];
  v6 = a4;
  objc_msgSend(v5, "CSQueryStringForSLHighlightsForContentType:forChatIdentifiers:", +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v4), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
