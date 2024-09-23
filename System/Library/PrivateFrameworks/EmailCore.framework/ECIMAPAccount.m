@implementation ECIMAPAccount

- (BOOL)compactWhenClosingMailboxes
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CompactWhenClosingMailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setCompactWhenClosingMailboxes:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (int64_t)daysBetweenSyncs
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DaysBetweenSyncs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setDaysBetweenSyncs:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (void)clearDaysBetweenSyncs
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", 0, CFSTR("DaysBetweenSyncs"));
}

- (BOOL)queriedUserToSetPathPrefix
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("QueriedUserToSetPathPrefix"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setQueriedUserToSetPathPrefix:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (void)clearQueriedUserToSetPathPrefix
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", 0, CFSTR("QueriedUserToSetPathPrefix"));
}

- (BOOL)shouldUseGmailLabelStores
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ShouldUseGmailLabelStores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setShouldUseGmailLabelStores:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)shouldUseGmailLabelStoresIsSet
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ShouldUseGmailLabelStores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)needsGmailLablesCleanup
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NeedsGmailLabelsCleanup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setNeedsGmailLablesCleanup:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasServerDefinedAllMailMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasServerDefinedAllMailMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasServerDefinedAllMailMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasServerDefinedArchiveMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasServerDefinedArchiveMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasServerDefinedArchiveMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasServerDefinedDraftsMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasServerDefinedDraftsMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasServerDefinedDraftsMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasServerDefinedJunkMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasServerDefinedJunkMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasServerDefinedJunkMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasServerDefinedSentMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasServerDefinedSentMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasServerDefinedSentMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasServerDefinedTrashMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasServerDefinedTrashMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasServerDefinedTrashMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)ignoreServerDefinedArchiveMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IgnoreServerDefinedArchiveMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setIgnoreServerDefinedArchiveMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)ignoreServerDefinedDraftsMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IgnoreServerDefinedDraftsMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setIgnoreServerDefinedDraftsMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)ignoreServerDefinedJunkMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IgnoreServerDefinedJunkMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setIgnoreServerDefinedJunkMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)ignoreServerDefinedSentMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IgnoreServerDefinedSentMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setIgnoreServerDefinedSentMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)ignoreServerDefinedTrashMailbox
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IgnoreServerDefinedTrashMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setIgnoreServerDefinedTrashMailbox:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

+ (id)standardPorts
{
  return &unk_1E7135E88;
}

+ (id)standardSSLPorts
{
  return &unk_1E7135EA0;
}

- (int64_t)defaultPortNumber
{
  return 143;
}

- (int64_t)defaultSecurePortNumber
{
  return 993;
}

- (id)_hostnameFromParentAccount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)portNumberObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ECIMAPAccount;
  -[ECAccount portNumberObject](&v12, sel_portNumberObject);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ECAccount systemAccount](self, "systemAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFA0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ECAccount standardPorts](self, "standardPorts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsObject:", v7))
      {

      }
      else
      {
        -[ECAccount standardSSLPorts](self, "standardSSLPorts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v7);

        if ((v10 & 1) == 0)
        {
          v3 = v7;
          goto LABEL_7;
        }
      }
    }
    v3 = 0;
LABEL_7:

  }
  return v3;
}

- (id)usesSSLObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ECIMAPAccount;
  -[ECAccount usesSSLObject](&v9, sel_usesSSLObject);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ECAccount systemAccount](self, "systemAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFA8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "BOOLValue"))
      v3 = v7;
    else
      v3 = 0;

  }
  return v3;
}

- (NSDate)dateOfLastSync
{
  return self->_dateOfLastSync;
}

- (void)setDateOfLastSync:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastSync, 0);
}

@end
