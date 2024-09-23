@implementation GKAchievementDescription

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKAchievementDescription internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKAchievementDescription internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (GKAchievementDescription)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKAchievementDescription *v5;
  GKAchievementDescription *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[GKInternalRepresentation internalRepresentation](GKAchievementInternal, "internalRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKAchievementDescription;
  v5 = -[GKAchievementDescription init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_internal, v4);

  return v6;
}

- (GKAchievementDescription)init
{
  return -[GKAchievementDescription initWithInternalRepresentation:](self, "initWithInternalRepresentation:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAchievementDescription)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  GKAchievementDescription *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("internal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[GKAchievementDescription initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKAchievementDescription internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("internal"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKAchievementDescription;
  -[GKAchievementDescription description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementDescription identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementDescription title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKAchievementDescription isHidden](self, "isHidden"))
    v6 = CFSTR("hidden");
  else
    v6 = CFSTR("visible");
  -[GKAchievementDescription achievedDescription](self, "achievedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("id: %@\t%@\t%@\t%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageNameForIcon
{
  return 0;
}

- (id)game
{
  return 0;
}

+ (void)loadAchievementDescriptionsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  +[GKGame currentGame](GKGame, "currentGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__GKAchievementDescription_loadAchievementDescriptionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E75B1CF0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "loadAchievementDescriptionsForGame:withCompletionHandler:", v5, v7);

}

void __77__GKAchievementDescription_loadAchievementDescriptionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

    }
  }

}

+ (id)_achievementDescriptionFromGame:(id)a3 propertyListDictionary:(id)a4
{
  id v5;
  id v6;
  GKLocalizedAchievementDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(GKLocalizedAchievementDescription);
  -[GKLocalizedAchievementDescription setGame:](v7, "setGame:", v6);

  +[GKInternalRepresentation internalRepresentation](GKAchievementInternal, "internalRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v9);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nameKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("earnedDescriptionKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAchievedDescription:", v11);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unearnedDescriptionKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUnachievedDescription:", v12);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maximumPoints"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaximumPoints:", (unsigned __int16)objc_msgSend(v13, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hiddenUntilSubmitted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("canReplay"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReplayable:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iconImageName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLocalizedAchievementDescription setIconImageName:](v7, "setIconImageName:", v16);
  -[GKAchievementDescription setInternal:](v7, "setInternal:", v8);

  return v7;
}

+ (id)_loadLocalAchievementDescriptionsForGame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "gameDescriptorDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKContentPropertyList localPropertyListForGameDescriptor:](GKContentPropertyList, "localPropertyListForGameDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "achievementDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__GKAchievementDescription__loadLocalAchievementDescriptionsForGame___block_invoke;
    v10[3] = &unk_1E75B2AB0;
    v12 = a1;
    v11 = v4;
    objc_msgSend(v7, "_gkMapWithBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __69__GKAchievementDescription__loadLocalAchievementDescriptionsForGame___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_achievementDescriptionFromGame:propertyListDictionary:", *(_QWORD *)(a1 + 32), a2);
}

+ (void)loadAchievementDescriptionsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_loadLocalAchievementDescriptionsForGame:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke;
    block[3] = &unk_1E75B1BF0;
    v33 = v7;
    v32 = v8;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v11 = v33;
  }
  else
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__3;
    v29[4] = __Block_byref_object_dispose__3;
    v30 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gameStatService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gameDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_46;
    v25[3] = &unk_1E75B2AD8;
    v18 = v12;
    v26 = v18;
    v28 = v29;
    v19 = v13;
    v27 = v19;
    objc_msgSend(v15, "getAchievementDescriptionsForGameDescriptor:handler:", v16, v25);

    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E75B2B00;
    v22 = v18;
    v23 = v7;
    v24 = v29;
    v10 = v7;
    v20 = v18;
    dispatch_group_notify(v19, MEMORY[0x1E0C80D38], v21);

    _Block_object_dispose(v29, 8);
    v11 = v30;
  }

}

uint64_t __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GKAchievementDescription *v13;
  GKAchievementDescription *v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count") >= 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = [GKAchievementDescription alloc];
          v14 = -[GKAchievementDescription initWithInternalRepresentation:](v13, "initWithInternalRepresentation:", v12, (_QWORD)v18);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v6;
  v17 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
  {
    v2 = result;
    if (objc_msgSend(*(id *)(result + 32), "count"))
      v3 = *(_QWORD *)(v2 + 32);
    else
      v3 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40));
  }
  return result;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKAchievementDescription;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKAchievementDescription;
  -[GKAchievementDescription methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKAchievementDescription forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKAchievementDescription;
  if (-[GKAchievementDescription respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKAchievementDescription forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKAchievementInternal instancesRespondToSelector:](GKAchievementInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKAchievementDescription internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKAchievementDescription internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKAchievementInternal)internal
{
  return (GKAchievementInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
