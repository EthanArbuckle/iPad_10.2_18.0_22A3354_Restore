@implementation FBKFeedbackFollowupResponse

+ (id)entityName
{
  return CFSTR("FeedbackFollowupResponse");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("created_at"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKDateFromServerString(v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ffr_type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[FBKFeedbackFollowupResponse followupResponseTypeFromString:](FBKFeedbackFollowupResponse, "followupResponseTypeFromString:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFeedbackFollowupResponse setType:](self, "setType:", v7);
  -[FBKFeedbackFollowupResponse setRole:](self, "setRole:", v9);
  -[FBKFeedbackFollowupResponse setText:](self, "setText:", v11);
  -[FBKFeedbackFollowupResponse setCreatedAt:](self, "setCreatedAt:", v12);

}

+ (unint64_t)followupResponseTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (followupResponseTypeFromString__onceToken[0] != -1)
    dispatch_once(followupResponseTypeFromString__onceToken, &__block_literal_global_48);
  objc_msgSend((id)followupResponseTypeFromString__mapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = -1;

  return v6;
}

void __62__FBKFeedbackFollowupResponse_followupResponseTypeFromString___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("file_name");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("text");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)followupResponseTypeFromString__mapping;
  followupResponseTypeFromString__mapping = v2;

}

+ (int64_t)sortValueOfFollowupResponseRole:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR(":request_info")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(":additional_info")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(":comments")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(":why_opt_out")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR(":is_validated")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (BOOL)isValidated
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[FBKFeedbackFollowupResponse isValidationResponse](self, "isValidationResponse");
  if (v3)
  {
    -[FBKFeedbackFollowupResponse text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("true"));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isValidationResponse
{
  void *v2;
  char v3;

  -[FBKFeedbackFollowupResponse role](self, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR(":is_validated"));

  return v3;
}

- (unint64_t)type
{
  void *v3;
  unint64_t v4;

  -[FBKFeedbackFollowupResponse willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("type"));
  -[FBKFeedbackFollowupResponse primitiveType](self, "primitiveType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKFeedbackFollowupResponse didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("type"));
  return v4;
}

- (void)setType:(unint64_t)a3
{
  void *v5;

  -[FBKFeedbackFollowupResponse willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowupResponse setPrimitiveType:](self, "setPrimitiveType:", v5);

  -[FBKFeedbackFollowupResponse didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("type"));
}

@end
