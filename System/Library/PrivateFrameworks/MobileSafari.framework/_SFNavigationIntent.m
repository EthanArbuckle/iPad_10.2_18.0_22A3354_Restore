@implementation _SFNavigationIntent

+ (int64_t)defaultTabOrder
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "BOOLForKey:", CFSTR("OpenLinksInBackground")))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

+ (int64_t)effectiveTabOrderWithPreferredTabOrder:(int64_t)a3
{
  if (a3)
    return a3;
  else
    return +[_SFNavigationIntent defaultTabOrder](_SFNavigationIntent, "defaultTabOrder");
}

- (id)_initWithType:(unint64_t)a3 value:(id)a4 policy:(int64_t)a5
{
  id v9;
  _SFNavigationIntent *v10;
  _SFNavigationIntent *v11;
  _SFNavigationIntent *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SFNavigationIntent;
  v10 = -[_SFNavigationIntent init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong(&v10->_value, a4);
    v11->_policy = a5;
    v11->_shouldRelateToSourceTab = 1;
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  v5 = self->_type - 1;
  if (v5 > 8)
    v6 = CFSTR("Bookmark");
  else
    v6 = off_1E21E4AC8[v5];
  v7 = self->_policy - 1;
  if (v7 > 5)
    v8 = CFSTR("Current Tab");
  else
    v8 = off_1E21E4B10[v7];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type = %@; policy = %@; value = %@"),
    v4,
    self,
    v6,
    v8,
    self->_value);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_SFNavigationIntent shouldRelateToSourceTab](self, "shouldRelateToSourceTab"))
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("; sourceWindow = %@"), self->_sourceWindowUUID);
    objc_msgSend(v9, "appendFormat:", CFSTR("; sourceTab = %@"), self->_sourceTabUUID);
  }
  objc_msgSend(v9, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (WebBookmark)bookmark
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_value;
  else
    v3 = 0;
  return (WebBookmark *)v3;
}

- (SFTabStateData)recentlyClosedTabStateData
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_value;
  else
    v3 = 0;
  return (SFTabStateData *)v3;
}

- (WBSCloudTabItem)cloudTab
{
  id v3;

  if (objc_msgSend(self->_value, "conformsToProtocol:", &unk_1EE08A1C0))
    v3 = self->_value;
  else
    v3 = 0;
  return (WBSCloudTabItem *)v3;
}

- (NSURL)URL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = 0;
  switch(self->_type)
  {
    case 0uLL:
      v4 = (void *)MEMORY[0x1E0C99E98];
      -[_SFNavigationIntent bookmark](self, "bookmark");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "address");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      -[_SFNavigationIntent cloudTab](self, "cloudTab");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
    case 6uLL:
    case 8uLL:
      v3 = self->_value;
      goto LABEL_9;
    case 3uLL:
      v4 = (void *)MEMORY[0x1E0C99E98];
      -[_SFNavigationIntent recentlyClosedTabStateData](self, "recentlyClosedTabStateData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v6;
      objc_msgSend(v4, "URLWithString:", v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      break;
    case 7uLL:
      objc_msgSend(self->_value, "URL");
      v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v2 = v3;
      break;
    default:
      return (NSURL *)v2;
  }
  return (NSURL *)v2;
}

- (NSString)text
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_value;
  else
    v3 = 0;
  return (NSString *)v3;
}

- (UIEventAttribution)eventAttribution
{
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(self->_value, "options");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "eventAttribution");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (UIEventAttribution *)v4;
}

- (NSDictionary)externalOptions
{
  void *v2;

  if (self->_type == 7)
  {
    objc_msgSend(self->_value, "URLOptionsDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v2;
}

- (NSArray)navigationIntents
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_value;
  else
    v3 = 0;
  return (NSArray *)v3;
}

- (BOOL)shouldOrderToForeground
{
  return (self->_policy < 5uLL) & (0x1Bu >> self->_policy);
}

- (BOOL)opensInNewTab
{
  return (self->_policy > 6uLL) | (0x1Eu >> self->_policy) & 1;
}

- (BOOL)opensInNewWindow
{
  return self->_policy > 6uLL || (self->_policy & 0x7F) == 4;
}

- (BOOL)canUseExistingBlankTab
{
  unint64_t type;
  void *v5;
  void *v6;
  char v7;

  type = self->_type;
  switch(type)
  {
    case 9uLL:
      -[_SFNavigationIntent navigationIntents](self, "navigationIntents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canUseExistingBlankTab");

      return v7;
    case 7uLL:
      return 1;
    case 3uLL:
      return 0;
    default:
      return -[_SFNavigationIntent opensInNewWindow](self, "opensInNewWindow")
          || !-[_SFNavigationIntent opensInNewTab](self, "opensInNewTab")
          || self->_policy == 3;
  }
}

- (BOOL)shouldRelateToSourceTab
{
  return (unint64_t)(self->_policy - 1) <= 3 && self->_shouldRelateToSourceTab;
}

- (NSString)privacyPreservingDescription
{
  unint64_t type;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  const __CFString *v17;
  unint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v22;
  void *v23;

  type = self->_type;
  if (type <= 9)
  {
    if (((1 << type) & 0x1CF) != 0)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[_SFNavigationIntent URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<url; scheme = %@>"), v6);
    }
    else
    {
      if (((1 << type) & 0x30) != 0)
      {
        -[_SFNavigationIntent text](self, "text");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safari_stringByRemovingCharactersInSet:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");

        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = objc_msgSend(v5, "length");
        v13 = CFSTR("false");
        if (!v10)
          v13 = CFSTR("true");
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<text; length = %lu; onlyWhitespace = %@>"), v12, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[_SFNavigationIntent navigationIntents](self, "navigationIntents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safari_mapObjectsUsingBlock:", &__block_literal_global_27);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n\t"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("[\n\t%@\n]"), v6);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  v16 = self->_type - 1;
  if (v16 > 8)
    v17 = CFSTR("Bookmark");
  else
    v17 = off_1E21E4AC8[v16];
  v18 = self->_policy - 1;
  if (v18 > 5)
    v19 = CFSTR("Current Tab");
  else
    v19 = off_1E21E4B10[v18];
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@; type = %@; policy = %@; value = %@>"), v15, v17, v19, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (BOOL)externalURLSourceApplicationIsSpotlight
{
  void *v2;
  void *v3;
  char v4;

  if (self->_type != 7)
    return 0;
  objc_msgSend(self->_value, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (void)setShouldRelateToSourceTab:(BOOL)a3
{
  self->_shouldRelateToSourceTab = a3;
}

- (BOOL)shouldPromptBeforeHandling
{
  return self->_shouldPromptBeforeHandling;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (BOOL)shouldDismissSidebarOnLoad
{
  return self->_shouldDismissSidebarOnLoad;
}

- (void)setShouldDismissSidebarOnLoad:(BOOL)a3
{
  self->_shouldDismissSidebarOnLoad = a3;
}

- (NSUUID)sourceTabUUID
{
  return self->_sourceTabUUID;
}

- (void)setSourceTabUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTabUUID, a3);
}

- (NSUUID)sourceWindowUUID
{
  return self->_sourceWindowUUID;
}

- (void)setSourceWindowUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceWindowUUID, a3);
}

- (_WKActivatedElementInfo)sourceElementInfo
{
  return self->_sourceElementInfo;
}

- (void)setSourceElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sourceElementInfo, a3);
}

- (BOOL)isChildIntent
{
  return self->_isChildIntent;
}

- (void)setIsChildIntent:(BOOL)a3
{
  self->_isChildIntent = a3;
}

- (BOOL)neverPromptWhenOpeningMultipleIntents
{
  return self->_neverPromptWhenOpeningMultipleIntents;
}

- (void)setNeverPromptWhenOpeningMultipleIntents:(BOOL)a3
{
  self->_neverPromptWhenOpeningMultipleIntents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceElementInfo, 0);
  objc_storeStrong((id *)&self->_sourceWindowUUID, 0);
  objc_storeStrong((id *)&self->_sourceTabUUID, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
