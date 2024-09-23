@implementation DNDMutableSenderConfiguration

- (void)setAllowedContactTypes:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *allowedContactTypes;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  allowedContactTypes = self->super._allowedContactTypes;
  self->super._allowedContactTypes = v4;

}

- (void)setDeniedContactTypes:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *deniedContactTypes;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  deniedContactTypes = self->super._deniedContactTypes;
  self->super._deniedContactTypes = v4;

}

- (void)setAllowedContactGroups:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *allowedContactGroups;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  allowedContactGroups = self->super._allowedContactGroups;
  self->super._allowedContactGroups = v4;

}

- (void)setDeniedContactGroups:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *deniedContactGroups;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  deniedContactGroups = self->super._deniedContactGroups;
  self->super._deniedContactGroups = v4;

}

- (void)setAllowedContacts:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *allowedContacts;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  allowedContacts = self->super._allowedContacts;
  self->super._allowedContacts = v4;

}

- (void)setDeniedContacts:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *deniedContacts;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  deniedContacts = self->super._deniedContacts;
  self->super._deniedContacts = v4;

}

- (void)setPhoneCallBypassSettings:(id)a3
{
  DNDBypassSettings *v4;
  DNDBypassSettings *phoneCallBypassSettings;

  v4 = (DNDBypassSettings *)objc_msgSend(a3, "copy");
  phoneCallBypassSettings = self->super._phoneCallBypassSettings;
  self->super._phoneCallBypassSettings = v4;

}

- (void)removeAllowedContactMatchingContact:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->super._allowedContacts;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((objc_msgSend(v4, "matchesContact:", v10, (_QWORD)v12) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_13;
    -[NSMutableSet removeObject:](self->super._allowedContacts, "removeObject:", v11);
    v5 = v11;
  }
LABEL_12:

LABEL_13:
}

- (void)removeDeniedContactMatchingContact:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->super._deniedContacts;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((objc_msgSend(v4, "matchesContact:", v10, (_QWORD)v12) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_13;
    -[NSMutableSet removeObject:](self->super._deniedContacts, "removeObject:", v11);
    v5 = v11;
  }
LABEL_12:

LABEL_13:
}

@end
