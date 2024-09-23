@implementation CALNEventRepresentationDataSourceUtils

+ (void)updateEventRepresentation:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(a1, "_userActivityUserInfoForEvent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserActivityUserInfo:", v7);
  objc_msgSend(v12, "organizerContactDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "organizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isCurrentUser") & 1) == 0)
    {
      objc_msgSend(v6, "organizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOrganizerForContactDictionary:", v11);

    }
  }

}

+ (id)_userActivityUserInfoForEvent:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE14878];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithEvent:view:forceLocal:", v4, 1, 1);

  objc_msgSend(v5, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
