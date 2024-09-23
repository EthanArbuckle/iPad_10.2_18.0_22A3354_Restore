@implementation CRRecentContact

- (CRRecentContact)initWithContactID:(int64_t)a3
{
  CRRecentContact *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRRecentContact;
  result = -[CRRecentContact init](&v5, sel_init);
  if (result)
    result->_contactID = a3;
  return result;
}

- (CRRecentContact)initWithAddress:(id)a3 displayName:(id)a4 kind:(id)a5 recentDate:(id)a6 recentsDomain:(id)a7
{
  CRRecentContact *v14;
  CRRecentContact *v15;

  if (a7)
  {
    if (a3)
      goto LABEL_3;
LABEL_11:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRRecentContact.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));
    if (a5)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRRecentContact.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recentsDomain"));
  if (!a3)
    goto LABEL_11;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_12:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRRecentContact.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));
LABEL_4:
  v14 = -[CRRecentContact initWithContactID:](self, "initWithContactID:", 0x7FFFFFFFLL);
  v15 = v14;
  if (v14)
  {
    v14->_recentID = 0x7FFFFFFFFFFFFFFFLL;
    v14->_recentsDomain = (NSString *)objc_msgSend(a7, "copy");
    v15->_address = (NSString *)objc_msgSend(a3, "copy");
    v15->_kind = (NSString *)objc_msgSend(a5, "copy");
    if (a4 && objc_msgSend(a4, "caseInsensitiveCompare:", a3))
      v15->_displayName = (NSString *)objc_msgSend(a4, "copy");
    v15->_recentDates = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a6, 0);
    v15->_groupKind = 0;
  }
  return v15;
}

- (CRRecentContact)initWithMembers:(id)a3 displayName:(id)a4 recentDate:(id)a5 recentsDomain:(id)a6
{
  CRRecentContact *v12;

  if (a6)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRRecentContact.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recentsDomain"));
    if (a3)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRRecentContact.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("members"));
LABEL_3:
  v12 = -[CRRecentContact initWithContactID:](self, "initWithContactID:", 0x7FFFFFFFLL);
  -[CRRecentContact setRecentID:](v12, "setRecentID:", 0x7FFFFFFFFFFFFFFFLL);
  -[CRRecentContact setDisplayName:](v12, "setDisplayName:", a4);
  -[CRRecentContact setKind:](v12, "setKind:", CFSTR("group"));
  -[CRRecentContact setRecentsDomain:](v12, "setRecentsDomain:", a6);
  if (a5)
    -[CRRecentContact setRecentDates:](v12, "setRecentDates:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a5));
  if (v12)
    -[CRRecentContact setMembers:](v12, "setMembers:", a3);
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRRecentContact;
  -[CRRecentContact dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  unint64_t groupKind;
  __CFString *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  -[CRRecentContact appendSanitizedDescriptionTo:](self, "appendSanitizedDescriptionTo:", v3);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ <%@:%@>"), self->_displayName, self->_kind, self->_address);
  if (-[CRRecentContact isGroup](self, "isGroup"))
  {
    groupKind = self->_groupKind;
    v5 = groupKind > 2 ? 0 : off_1E4D325E8[groupKind];
    objc_msgSend(v3, "appendFormat:", CFSTR(" groupKind: %@"), v5);
    objc_msgSend(v3, "appendString:", CFSTR("\n      Members:\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = -[CRRecentContact members](self, "members");
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "appendFormat:", CFSTR("      %@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)sanitizedDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  -[CRRecentContact appendSanitizedDescriptionTo:](self, "appendSanitizedDescriptionTo:", v3);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)appendSanitizedDescriptionTo:(id)a3
{
  objc_class *v5;
  _BOOL4 v6;
  const char *v7;

  v5 = (objc_class *)objc_opt_class();
  objc_msgSend(a3, "appendFormat:", CFSTR("<%@ %p"), NSStringFromClass(v5), self);
  if (self->_recentID == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "appendString:", CFSTR(" rid=<null-recent-id>"));
  else
    objc_msgSend(a3, "appendFormat:", CFSTR(" rid=%lld"), self->_recentID);
  if (self->_contactID == 0x7FFFFFFF)
    objc_msgSend(a3, "appendString:", CFSTR(" cid=<null-contact-id>"));
  else
    objc_msgSend(a3, "appendFormat:", CFSTR(" cid=%lld"), self->_contactID);
  objc_msgSend(a3, "appendFormat:", CFSTR(" metadata-keys=%lu"), -[NSDictionary count](self->_metadata, "count"));
  v6 = -[CRRecentContact isGroup](self, "isGroup");
  v7 = "n";
  if (v6)
    v7 = "y";
  objc_msgSend(a3, "appendFormat:", CFSTR(" isGroup=%s"), v7);
}

- (BOOL)isGroup
{
  return -[NSString isEqualToString:](-[CRRecentContact kind](self, "kind"), "isEqualToString:", CFSTR("group"));
}

- (__CFStringTokenizer)_wordTokenizerForString:(id)a3 locale:(id)a4
{
  const __CFLocale *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  CFStringTokenizerRef v9;
  BOOL v10;
  CFRange v12;
  CFRange v13;

  v4 = (const __CFLocale *)a4;
  if (!a4)
    v4 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRCachedWordTokenizerLocale"));
  v8 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRCachedWordTokenizer"));
  v9 = (CFStringTokenizerRef)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (!v8)
    {
LABEL_11:
      v13.length = objc_msgSend(a3, "length");
      v13.location = 0;
      v9 = CFStringTokenizerCreate(0, (CFStringRef)a3, v13, 4uLL, v4);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFAutorelease(v9), CFSTR("CRCachedWordTokenizer"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("CRCachedWordTokenizerLocale"));
      return v9;
    }
  }
  else if ((objc_msgSend(v7, "isEqual:", v4) & 1) == 0)
  {
    goto LABEL_11;
  }
  v12.length = objc_msgSend(a3, "length");
  v12.location = 0;
  CFStringTokenizerSetString(v9, (CFStringRef)a3, v12);
  return v9;
}

- (void)_enumerateWordsInString:(id)a3 usingBlock:(id)a4
{
  __CFStringTokenizer *v5;
  CFRange CurrentTokenRange;
  char v7;
  _QWORD v8[2];
  CFStringTokenizerTokenType (*v9)(uint64_t);
  void *v10;
  __CFStringTokenizer *v11;

  v5 = -[CRRecentContact _wordTokenizerForString:locale:](self, "_wordTokenizerForString:locale:", a3, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __54__CRRecentContact__enumerateWordsInString_usingBlock___block_invoke;
  v10 = &__block_descriptor_40_e5_Q8__0l;
  v11 = v5;
  v7 = 0;
  if (__54__CRRecentContact__enumerateWordsInString_usingBlock___block_invoke((uint64_t)v8))
  {
    do
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v5);
      (*((void (**)(id, CFIndex, CFIndex, char *))a4 + 2))(a4, CurrentTokenRange.location, CurrentTokenRange.length, &v7);
    }
    while (!v7 && (uint64_t)v9((uint64_t)v8));
  }
}

CFStringTokenizerTokenType __54__CRRecentContact__enumerateWordsInString_usingBlock___block_invoke(uint64_t a1)
{
  CFStringTokenizerTokenType Token;
  CFStringTokenizerTokenType v3;

  do
  {
    while (1)
    {
      Token = CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(a1 + 32));
      v3 = Token;
      if (!Token)
        break;
      if ((Token & 0x10) == 0)
        return v3;
    }
  }
  while (CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(_QWORD *)(a1 + 32)).location != -1);
  return v3;
}

- (BOOL)hasFullTextMatch:(id)a3
{
  uint64_t *v5;
  NSString *address;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSString *displayName;
  char v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;

  v5 = &v15;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  address = self->_address;
  if (address)
  {
    v7 = -[NSString caseInsensitiveCompare:](address, "caseInsensitiveCompare:", a3) == NSOrderedSame;
    v5 = v16;
  }
  else
  {
    v7 = 0;
  }
  v18 = v7;
  if (!*((_BYTE *)v5 + 24))
  {
    if (-[NSString isEqualToString:](self->_kind, "isEqualToString:", CFSTR("email")))
    {
      v8 = -[NSString cr_rangeOfAddressDomain](self->_address, "cr_rangeOfAddressDomain");
      if (v8 >= 3 && v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = -[NSString compare:options:range:](self->_address, "compare:options:range:", a3, 9, 0, v8 - (objc_msgSend(a3, "hasSuffix:", CFSTR("@")) ^ 1)) == NSOrderedSame;
        *((_BYTE *)v16 + 24) = v9;
      }
    }
  }
  if (!*((_BYTE *)v16 + 24) && -[NSString length](self->_displayName, "length"))
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    displayName = self->_displayName;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__CRRecentContact_hasFullTextMatch___block_invoke;
    v14[3] = &unk_1E4D324C0;
    v14[4] = self;
    v14[5] = a3;
    v14[7] = &v15;
    v14[8] = 385;
    v14[6] = v10;
    -[CRRecentContact _enumerateWordsInString:usingBlock:](self, "_enumerateWordsInString:usingBlock:", displayName, v14);
  }
  v12 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __36__CRRecentContact_hasFullTextMatch___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "compare:options:range:locale:", a1[5], a1[8], a2, a3, a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result == 0;
  *a4 = result == 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = self->_address
    && objc_msgSend(a3, "address")
    && -[NSString isEqualToString:](self->_address, "isEqualToString:", objc_msgSend(a3, "address"));
  if (-[CRRecentContact isGroup](self, "isGroup"))
  {
    if (objc_msgSend(a3, "isGroup"))
    {
      if (objc_msgSend(a3, "recentID") == self->_recentID)
        return 1;
      return v5;
    }
    return 0;
  }
  return v5;
}

- (unint64_t)hash
{
  NSString *address;

  address = self->_address;
  if (address)
    return -[NSString hash](address, "hash");
  else
    return self->_recentID;
}

- (void)applyWeight:(id)a3
{
  NSNumber *weight;

  if (self->_weight)
  {
    if (objc_msgSend(a3, "compare:") != 1)
      return;
    weight = self->_weight;
  }
  else
  {
    weight = 0;
  }

  self->_weight = (NSNumber *)a3;
}

- (unint64_t)countOfRecents
{
  return -[NSMutableArray count](self->_recentDates, "count");
}

- (NSDate)mostRecentDate
{
  NSDate *result;

  result = (NSDate *)-[NSMutableArray count](self->_recentDates, "count");
  if (result)
    return (NSDate *)-[NSMutableArray objectAtIndex:](self->_recentDates, "objectAtIndex:", 0);
  return result;
}

- (NSDate)leastRecentDate
{
  return (NSDate *)-[NSMutableArray lastObject](self->_recentDates, "lastObject");
}

- (NSArray)recentDates
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_recentDates);
}

- (void)setRecentDates:(id)a3
{
  NSMutableArray *recentDates;

  recentDates = self->_recentDates;
  if (recentDates != a3)
  {

    self->_recentDates = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  }
}

- (void)recordRecentEventForDate:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;
  char v8;

  v4 = a4;
  -[CRRecentContact lazilyCreateRecentDates](self, "lazilyCreateRecentDates");
  v8 = 1;
  v7 = -[CRRecentContact insertionIndexForDate:wouldBeUnique:](self, "insertionIndexForDate:wouldBeUnique:", a3, &v8);
  if (v4 || v8)
    -[CRRecentContact insertDate:atIndex:required:](self, "insertDate:atIndex:required:", a3, v7, v4);
}

- (void)lazilyCreateRecentDates
{
  if (!self->_recentDates)
    self->_recentDates = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
}

- (unint64_t)insertionIndexForDate:(id)a3 wouldBeUnique:(BOOL *)a4
{
  unint64_t result;
  char v6;

  v6 = 0;
  result = -[NSMutableArray cr_binaryInsertionIndexOfObject:usingComparator:match:](self->_recentDates, "cr_binaryInsertionIndexOfObject:usingComparator:match:", a3, &__block_literal_global_271, &v6);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    -[CRRecentContact insertionIndexForDate:wouldBeUnique:].cold.1();
  *a4 = v6 ^ 1;
  return result;
}

- (void)insertDate:(id)a3 atIndex:(unint64_t)a4 required:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  -[NSMutableArray insertObject:atIndex:](self->_recentDates, "insertObject:atIndex:", a3);
  if (a4 >= 5 && v5)
    -[NSMutableArray removeObjectAtIndex:](self->_recentDates, "removeObjectAtIndex:", 0);
  -[NSMutableArray cr_removeObjectsStartingAtIndex:](self->_recentDates, "cr_removeObjectsStartingAtIndex:", 5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRRecentContact)initWithCoder:(id)a3
{
  CRRecentContact *v4;
  CRRecentContact *v5;
  _QWORD v7[6];

  v4 = -[CRRecentContact initWithContactID:](self, "initWithContactID:", 0x7FFFFFFFFFFFFFFFLL);
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__CRRecentContact_initWithCoder___block_invoke;
    v7[3] = &unk_1E4D324E8;
    v7[4] = a3;
    v7[5] = v4;
    -[CRRecentContact enumerateArchivablePropertiesWithBlock:](v4, "enumerateArchivablePropertiesWithBlock:", v7);
  }
  return v5;
}

uint64_t __33__CRRecentContact_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;

  v6 = *(void **)(a1 + 32);
  if (a4)
    v7 = objc_msgSend(v6, "decodeObjectOfClasses:forKey:", a4, a2);
  else
    v7 = objc_msgSend(v6, "decodePropertyListForKey:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, a3);
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CRRecentContact_encodeWithCoder___block_invoke;
  v3[3] = &unk_1E4D324E8;
  v3[4] = self;
  v3[5] = a3;
  -[CRRecentContact enumerateArchivablePropertiesWithBlock:](self, "enumerateArchivablePropertiesWithBlock:", v3);
}

uint64_t __35__CRRecentContact_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", objc_msgSend(*(id *)(a1 + 32), "valueForKey:"), a2);
}

- (void)enumerateArchivablePropertiesWithBlock:(id)a3
{
  if (enumerateArchivablePropertiesWithBlock__onceToken != -1)
    dispatch_once(&enumerateArchivablePropertiesWithBlock__onceToken, &__block_literal_global_2);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("contactID"), CFSTR("archivableContactID"), enumerateArchivablePropertiesWithBlock__sNumberSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("recentID"), CFSTR("archivableRecentID"), enumerateArchivablePropertiesWithBlock__sNumberSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("recentsDomain"), CFSTR("recentsDomain"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("kind"), CFSTR("kind"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("address"), CFSTR("address"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("rawAddress"), CFSTR("rawAddress"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("recentDates"), CFSTR("recentDates"), enumerateArchivablePropertiesWithBlock__sArrayOfDatesSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("displayName"), CFSTR("displayName"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("groupName"), CFSTR("groupName"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("lastSendingAddress"), CFSTR("lastSendingAddress"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("originalSource"), CFSTR("originalSource"), enumerateArchivablePropertiesWithBlock__sStringSet);
  (*((void (**)(id, const __CFString *, const __CFString *, _QWORD))a3 + 2))(a3, CFSTR("metadata"), CFSTR("archivableMetadata"), 0);
  (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("weight"), CFSTR("weight"), enumerateArchivablePropertiesWithBlock__sNumberSet);
  if (-[CRRecentContact isGroup](self, "isGroup"))
  {
    (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("members"), CFSTR("archivableGroupMembers"), enumerateArchivablePropertiesWithBlock__sArrayOfContactsSet);
    (*((void (**)(id, const __CFString *, const __CFString *, uint64_t))a3 + 2))(a3, CFSTR("groupKind"), CFSTR("archivableGroupKind"), enumerateArchivablePropertiesWithBlock__sNumberSet);
  }
}

uint64_t __58__CRRecentContact_enumerateArchivablePropertiesWithBlock___block_invoke()
{
  id v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t result;

  enumerateArchivablePropertiesWithBlock__sNumberSet = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  enumerateArchivablePropertiesWithBlock__sStringSet = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  enumerateArchivablePropertiesWithBlock__sArrayOfDatesSet = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  result = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  enumerateArchivablePropertiesWithBlock__sArrayOfContactsSet = result;
  return result;
}

- (void)setArchivableRecentID:(id)a3
{
  -[CRRecentContact setRecentID:](self, "setRecentID:", objc_msgSend(a3, "cr_CRRecentIDValue"));
}

- (id)archivableRecentID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "cr_numberWithCRRecentID:", -[CRRecentContact recentID](self, "recentID"));
}

- (void)setArchivableContactID:(id)a3
{
  self->_contactID = objc_msgSend(a3, "cr_CRContactIDValue");
}

- (id)archivableContactID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "cr_numberWithCRContactID:", -[CRRecentContact contactID](self, "contactID"));
}

- (void)setArchivableGroupMembers:(id)a3
{

  self->_members = (NSArray *)a3;
}

- (void)setArchivableMetadata:(id)a3
{

  self->_metadata = (NSDictionary *)a3;
}

- (id)archivableMetadata
{
  return self->_metadata;
}

- (void)setArchivableGroupKind:(id)a3
{
  self->_groupKind = objc_msgSend(a3, "unsignedIntegerValue");
}

- (id)archivableGroupKind
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_groupKind);
}

- (int64_t)contactID
{
  return self->_contactID;
}

- (void)setContactID:(int64_t)a3
{
  self->_contactID = a3;
}

- (NSString)recentsDomain
{
  return self->_recentsDomain;
}

- (void)setRecentsDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)lastSendingAddress
{
  return self->_lastSendingAddress;
}

- (void)setLastSendingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)originalSource
{
  return self->_originalSource;
}

- (void)setOriginalSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)decayedWeight
{
  return self->_decayedWeight;
}

- (void)setDecayedWeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)groupKind
{
  return self->_groupKind;
}

- (void)setGroupKind:(unint64_t)a3
{
  self->_groupKind = a3;
}

- (int64_t)recentID
{
  return self->_recentID;
}

- (void)setRecentID:(int64_t)a3
{
  self->_recentID = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)rawAddress
{
  return self->_rawAddress;
}

- (void)setRawAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)insertionIndexForDate:wouldBeUnique:.cold.1()
{
  __assert_rtn("-[CRRecentContact insertionIndexForDate:wouldBeUnique:]", "CRRecentContact.m", 383, "idx != NSNotFound");
}

@end
