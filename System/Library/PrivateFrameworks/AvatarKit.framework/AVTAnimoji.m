@implementation AVTAnimoji

+ (id)animojiNames
{
  if (animojiNames_onceToken != -1)
    dispatch_once(&animojiNames_onceToken, &__block_literal_global_8);
  return (id)animojiNames_names;
}

void __26__AVTAnimoji_animojiNames__block_invoke()
{
  void *v0;

  v0 = (void *)animojiNames_names;
  animojiNames_names = (uint64_t)&unk_1EA6B8100;

}

+ (id)_scenePathForPuppetNamed:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  +[AVTResourceLocator sharedResourceLocator]();
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator pathForAnimojiResource:ofType:inDirectory:isDirectory:](v4, (uint64_t)v3, (uint64_t)CFSTR("scnz"), (uint64_t)v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_sceneURLForPuppetDirectoryURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, MEMORY[0x1E0C9AA60], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "lastPathComponent", (_QWORD)v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByDeletingPathExtension");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          objc_msgSend(v11, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("scnz")))
          {

LABEL_13:
            v19 = v11;
            goto LABEL_14;
          }
          objc_msgSend(v11, "pathExtension");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("scn"));

          if ((v18 & 1) != 0)
            goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)_sceneURL
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_url)
  {
    objc_msgSend((id)objc_opt_class(), "_sceneURLForPuppetDirectoryURL:", self->_url);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_name)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend((id)objc_opt_class(), "_scenePathForPuppetNamed:", self->_name);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_load
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1DD1FA000, a3, OS_LOG_TYPE_ERROR, "Error: could not load scene at %@ with error: %@", (uint8_t *)&v7, 0x16u);

}

- (void)loadIfNeeded
{
  if (!self->_avatarNode)
    -[AVTAnimoji _load](self, "_load");
}

- (id)avatarNode
{
  -[AVTAnimoji loadIfNeeded](self, "loadIfNeeded");
  return self->_avatarNode;
}

- (id)headNode
{
  return self->_headNode;
}

- (id)modelNode
{
  return -[SCNNode childNodeWithName:recursively:](self->_avatarNode, "childNodeWithName:recursively:", CFSTR("model"), 1);
}

- (void)update
{
  -[AVTAnimoji avatarNode](self, "avatarNode");

}

+ (id)animojiWithContentsOfURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setUrl:", v3);

  return v4;
}

- (AVTAnimoji)initWithName:(id)a3 error:(id *)p_isa
{
  id v7;
  void *v8;
  char v9;
  AVTAnimoji *v10;
  NSString **p_name;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "animojiNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) != 0)
    {
      v41.receiver = self;
      v41.super_class = (Class)AVTAnimoji;
      v10 = -[AVTAvatar init](&v41, sel_init);
      self = v10;
      if (!v10)
      {
LABEL_6:
        self = self;
        p_isa = (id *)&self->super.super.isa;
        goto LABEL_17;
      }
      p_name = &v10->_name;
      objc_storeStrong((id *)&v10->_name, a3);
      objc_msgSend((id)objc_opt_class(), "_scenePathForPuppetNamed:", *p_name);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

        goto LABEL_6;
      }
      avt_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[AVTAnimoji initWithName:error:].cold.2((uint64_t)&self->_name, v34, v35, v36, v37, v38, v39, v40);

    }
    else
    {
      if (p_isa)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Animoji name \"%@\"), v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 3, v25);
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

      }
      avt_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[AVTAnimoji initWithName:error:].cold.3((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);

    }
LABEL_16:
    p_isa = 0;
    goto LABEL_17;
  }
  avt_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[AVTAnimoji initWithName:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  if (p_isa)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2D50];
    v45[0] = CFSTR("Can't instanciate AVTAnimoji with nil name");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 3, v22);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
LABEL_17:

  return (AVTAnimoji *)p_isa;
}

+ (id)animojiNamed:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:error:", v3, 0);

  return v4;
}

- (id)newDescriptor
{
  return -[AVTAnimojiDescriptor initWithAnimoji:]([AVTAnimojiDescriptor alloc], "initWithAnimoji:", self);
}

- (AVTAnimoji)initWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  AVTAnimoji *v8;

  objc_msgSend(a3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAnimoji initWithName:error:](self, "initWithName:error:", v7, a5);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)thumbnailForAnimojiNamed:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  int v9;
  __CFString **v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTAnimojiThumbnailLargeSizeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTAnimojiThumbnailLargeSizeKey"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = -[__CFString BOOLValue](v8, "BOOLValue");
    v10 = AVTFramingModeCamera;
    if (!v9)
      v10 = AVTFramingModeGrid;
    v11 = *v10;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTAnimojiThumbnailCameraKey"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v11 = CFSTR("cameraGrid");
    if (v8)
      v11 = v8;
  }
  v12 = v11;

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVTResourceLocator sharedResourceLocator]();
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator pathForAnimojiResource:ofType:inDirectory:isDirectory:](v15, (uint64_t)v14, (uint64_t)CFSTR("atx"), (uint64_t)v5, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)usageIntent
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  -[AVTAnimoji loadIfNeeded](self, "loadIfNeeded", a3);
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setName:", self->_name);
  v5 = -[NSDictionary copy](self->_specializationSettings, "copy");
  v6 = v4[35];
  v4[35] = (id)v5;

  -[AVTAnimoji avatarNode](self, "avatarNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AVTCloneNodesAndMaterials(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4[33];
  v4[33] = (id)v8;

  objc_msgSend(v4[33], "childNodeWithName:recursively:", CFSTR("head"), 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v4[32];
  v4[32] = (id)v10;

  objc_msgSend(v4, "_avatarNodeAndHeadNodeAreNowAvailable");
  objc_msgSend(v4, "resetCustomBehaviours");
  objc_msgSend(v4, "updateBindings");
  -[SCNNode clone](self->_lightingNode, "clone");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v4[31];
  v4[31] = (id)v12;

  -[SCNNode clone](self->_cameraNode, "clone");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v4[34];
  v4[34] = (id)v14;

  objc_msgSend(v4[33], "enumerateHierarchyUsingBlock:", &__block_literal_global_139);
  return v4;
}

uint64_t __27__AVTAnimoji_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPhysicsBody:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AVTAnimoji newDescriptor](self, "newDescriptor");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptor"));

}

- (AVTAnimoji)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AVTAnimoji *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AVTAnimoji initWithDescriptor:usageIntent:error:](self, "initWithDescriptor:usageIntent:error:", v5, 0, 0);
  return v6;
}

+ (void)preloadAnimojiNamed:(id)a3
{
  id v4;

  +[AVTAnimoji puppetNamed:options:](AVTAnimoji, "puppetNamed:options:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preloadPuppet:", v4);

}

- (id)lightingNode
{
  -[AVTAnimoji loadIfNeeded](self, "loadIfNeeded");
  return self->_lightingNode;
}

- (id)cameraNode
{
  -[AVTAnimoji loadIfNeeded](self, "loadIfNeeded");
  return self->_cameraNode;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)specializationSettings
{
  return self->_specializationSettings;
}

- (void)configureForBestAnimationQuality
{
  void *v3;
  void *v4;
  int v5;

  -[AVTAnimoji name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("shark")))
  {

  }
  else
  {
    -[AVTAnimoji name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("lion"));

    if (!v5)
      return;
  }
  -[SCNNode enumerateHierarchyUsingBlock:](self->_avatarNode, "enumerateHierarchyUsingBlock:", &__block_literal_global_143);
}

void __46__AVTAnimoji_configureForBestAnimationQuality__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  objc_msgSend(a2, "morpher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 981668463;
  objc_msgSend(v3, "setWeightIncrementalThreshold:", v2);

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_headNode, 0);
  objc_storeStrong((id *)&self->_lightingNode, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: Can't find Animoji named %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithName:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: Unknown Animoji name \"%@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
