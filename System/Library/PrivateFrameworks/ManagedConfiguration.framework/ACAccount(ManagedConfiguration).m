@implementation ACAccount(ManagedConfiguration)

- (uint64_t)MCIsManaged
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("MCAccountIsManaged"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLValue") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "parentAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "MCIsManaged");

  }
  return v3;
}

- (id)mcAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcAccountIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("MCAccountIdentifer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcAccountIdentifier:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcAccountIdentifier:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("MCAccountIdentifer"));
  }

}

- (id)mcConfigurationProfileIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcConfigurationProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0C8EF48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcConfigurationProfileIdentifier:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcConfigurationProfileIdentifier:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, *MEMORY[0x1E0C8EF48]);
  }

}

- (id)mcProfileUUID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcProfileUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcProfileUUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcProfileUUID:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcProfileUUID:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcProfileUUID"));
  }

}

- (id)mcPayloadUUID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcPayloadUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcPayloadUUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcPayloadUUID:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcPayloadUUID:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcPayloadUUID"));
  }

}

- (id)mcEASAccountEnableNotes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcEASAccountEnableNotes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcEnableNotes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcEASAccountEnableNotes:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcEASAccountEnableNotes:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcEnableNotes"));
  }

}

- (id)mcEnableMailUserOverridable
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcEnableMailUserOverridable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcEnableMailUserOverridable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcEnableMailUserOverridable:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcEnableMailUserOverridable:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcEnableMailUserOverridable"));
  }

}

- (id)mcEnableContactsUserOverridable
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcEnableContactsUserOverridable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcEnableContactsUserOverridable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcEnableContactsUserOverridable:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcEnableContactsUserOverridable:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcEnableContactsUserOverridable"));
  }

}

- (id)mcEnableCalendarsUserOverridable
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcEnableCalendarsUserOverridable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcEnableCalendarsUserOverridable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcEnableCalendarsUserOverridable:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcEnableCalendarsUserOverridable:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcEnableCalendarsUserOverridable"));
  }

}

- (id)mcEnableRemindersUserOverridable
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcEnableRemindersUserOverridable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcEnableRemindersUserOverridable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcEnableRemindersUserOverridable:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcEnableRemindersUserOverridable:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcEnableRemindersUserOverridable"));
  }

}

- (id)mcEnableNotesUserOverridable
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcEnableNotesUserOverridable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("mcEnableNotesUserOverridable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setMcEnableNotesUserOverridable:()ManagedConfiguration
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMcEnableNotesUserOverridable:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("mcEnableNotesUserOverridable"));
  }

}

- (id)mcBackingProfile
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mcProfileUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "installedProfileIdentifiersWithFilterFlags:", 3);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x1A1AF0250](v4);
          objc_msgSend(v2, "installedProfileWithIdentifier:", v8, (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v1);

          if ((v12 & 1) != 0)
          {
            objc_autoreleasePoolPop(v9);
            goto LABEL_12;
          }

          objc_autoreleasePoolPop(v9);
          ++v7;
        }
        while (v5 != v7);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v5 = v4;
        if (v4)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)mcBackingPayload
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char v24;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *context;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mcProfileUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mcPayloadUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = 0;
  if (v2 && v3)
  {
    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "installedProfileIdentifiersWithFilterFlags:", 3);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v31)
    {
      v8 = *(_QWORD *)v37;
      v28 = v6;
      v29 = v2;
      v26 = *(_QWORD *)v37;
      v27 = v7;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          v10 = v8;
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1A1AF0250]();
          objc_msgSend(v6, "installedProfileWithIdentifier:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v2);

          v8 = v10;
          if (v15)
          {
            context = v12;
            objc_msgSend(v13, "payloads");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v33;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v33 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                  objc_msgSend(v22, "UUID", v26);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "isEqualToString:", v4);

                  if ((v24 & 1) != 0)
                  {
                    v5 = v22;

                    objc_autoreleasePoolPop(context);
                    v6 = v28;
                    v2 = v29;
                    v7 = v27;
                    goto LABEL_23;
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                if (v19)
                  continue;
                break;
              }
            }

            v6 = v28;
            v2 = v29;
            v8 = v26;
            v7 = v27;
            v12 = context;
          }

          objc_autoreleasePoolPop(v12);
        }
        v5 = 0;
        v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v31);
    }
    else
    {
      v5 = 0;
    }
LABEL_23:

  }
  return v5;
}

@end
