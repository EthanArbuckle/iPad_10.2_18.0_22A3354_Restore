@implementation FCHeadlineClusterOrderingPersonalized

- (id)orderTopicsWithClusteredHeadlines:(id)a3 additionalHeadlines:(id)a4 subscribedTagIDs:(id)a5 scoresByArticleID:(id)a6 personalizer:(id)a7 tagNameProvider:(id)a8 personalizationTreatment:(id)a9 translationProvider:(id)a10
{
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = (void *)MEMORY[0x1E0C99E40];
  v12 = a7;
  objc_msgSend(a3, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rankTagIDsDescending:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v11, "orderedSetWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
