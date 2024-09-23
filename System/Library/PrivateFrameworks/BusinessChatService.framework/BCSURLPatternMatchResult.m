@implementation BCSURLPatternMatchResult

- (BCSURLPatternMatchResult)initWithOriginalURL:(id)a3 extractedURL:(id)a4 totalConsecutivePrefixMatches:(unint64_t)a5 totalExactMatches:(unint64_t)a6 totalAnyMatches:(unint64_t)a7 bundleID:(id)a8 pattern:(id)a9 expirationDate:(id)a10 dateHelper:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  BCSURLPatternMatchResult *v20;
  BCSURLPatternMatchResult *v21;
  uint64_t v22;
  NSString *bundleID;
  uint64_t v24;
  NSString *pattern;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BCSURLPatternMatchResult;
  v20 = -[BCSURLPatternMatchResult init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_originalURL, a3);
    objc_storeStrong((id *)&v21->_extractedURL, a4);
    v21->_totalConsecutivePrefixMatches = a5;
    v21->_totalExactMatches = a6;
    v21->_totalAnyMatches = a7;
    v22 = objc_msgSend(v16, "copy");
    bundleID = v21->_bundleID;
    v21->_bundleID = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    pattern = v21->_pattern;
    v21->_pattern = (NSString *)v24;

    objc_storeStrong((id *)&v21->_expirationDate, a10);
    objc_storeStrong((id *)&v21->_dateHelper, a11);
  }

  return v21;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[BCSURLPatternMatchResult expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSURLPatternMatchResult dateHelper](self, "dateHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compare:", v5) == -1;

  return v6;
}

- (BOOL)matchFound
{
  void *v2;
  BOOL v3;

  -[BCSURLPatternMatchResult extractedURL](self, "extractedURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)-[BCSURLPatternMatchResult descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCSURLPatternMatchResult succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  BCSURLPatternMatchResult *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__BCSURLPatternMatchResult_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_24C39BED8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v7);
  v5 = v4;

  return v5;
}

void __54__BCSURLPatternMatchResult_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extractedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("Extracted URL"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("Most explicit matching bundleID"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pattern");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v10, CFSTR("Pattern"), 1);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCSURLPatternMatchResult descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BCSURLPatternMatchResult *v11;

  v4 = a3;
  -[BCSURLPatternMatchResult succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__BCSURLPatternMatchResult_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24C39BED8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __66__BCSURLPatternMatchResult_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "totalConsecutivePrefixMatches"), CFSTR("Total Consecutive Prefix Matches"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "totalExactMatches"), CFSTR("Total Exact Matches"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "totalAnyMatches"), CFSTR("Total Any Matches"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)extractedURL
{
  return self->_extractedURL;
}

- (NSString)pattern
{
  return self->_pattern;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)totalConsecutivePrefixMatches
{
  return self->_totalConsecutivePrefixMatches;
}

- (unint64_t)totalExactMatches
{
  return self->_totalExactMatches;
}

- (unint64_t)totalAnyMatches
{
  return self->_totalAnyMatches;
}

- (BCSDateHelperProtocol)dateHelper
{
  return self->_dateHelper;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_dateHelper, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_extractedURL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end
