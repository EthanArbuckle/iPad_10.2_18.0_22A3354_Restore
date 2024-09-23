@implementation SKNode

- (void)_removeAction:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableArray removeExactObject:](self->_actions, "removeExactObject:", v4);

}

- (void)_removeChild:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableArray removeExactObject:](self->_children, "removeExactObject:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<PKCAether>)_aether
{
  _QWORD *v2;
  shared_ptr<PKCAether> result;

  *v2 = 0;
  v2[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (PKCAether *)self;
  return result;
}

- (BOOL)isEqualToNode:(SKNode *)node
{
  SKNode *v4;
  SKNode *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  double v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  double v47;
  double v48;
  float v49;
  double v50;
  _BOOL4 v51;
  _BOOL4 v52;
  SKNodeFocusBehavior v53;
  double v54;
  double v55;
  float v56;
  double v57;
  _BOOL4 v59;
  CGRect v60;
  CGRect v61;

  v4 = node;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SKNode name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

      }
      else
      {
        -[SKNode name](v5, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_9:
          -[SKNode frame](self, "frame");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          -[SKNode frame](v5, "frame");
          v61.origin.x = v20;
          v61.origin.y = v21;
          v61.size.width = v22;
          v61.size.height = v23;
          v60.origin.x = v13;
          v60.origin.y = v15;
          v60.size.width = v17;
          v60.size.height = v19;
          if (CGRectEqualToRect(v60, v61))
          {
            -[SKNode position](self, "position");
            v25 = v24;
            v27 = v26;
            -[SKNode position](v5, "position");
            LOBYTE(v7) = 0;
            if (v25 == v29 && v27 == v28)
            {
              -[SKNode zPosition](self, "zPosition");
              v31 = v30;
              objc_opt_self();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "zPosition");
              v33 = v31;
              *(float *)&v34 = v34;
              if ((COERCE_UNSIGNED_INT(v33 - *(float *)&v34) & 0x60000000) != 0)
                goto LABEL_21;
              -[SKNode xScale](self, "xScale");
              v36 = v35;
              -[SKNode xScale](v5, "xScale");
              v37 = v36;
              *(float *)&v38 = v38;
              if ((COERCE_UNSIGNED_INT(v37 - *(float *)&v38) & 0x60000000) != 0)
                goto LABEL_21;
              -[SKNode yScale](self, "yScale");
              v40 = v39;
              -[SKNode yScale](v5, "yScale");
              v41 = v40;
              *(float *)&v42 = v42;
              if ((COERCE_UNSIGNED_INT(v41 - *(float *)&v42) & 0x60000000) != 0)
                goto LABEL_21;
              -[SKNode zRotation](self, "zRotation");
              v44 = v43;
              -[SKNode zRotation](v5, "zRotation");
              v45 = v44;
              *(float *)&v46 = v46;
              if ((COERCE_UNSIGNED_INT(v45 - *(float *)&v46) & 0x60000000) != 0)
                goto LABEL_21;
              -[SKNode alpha](self, "alpha");
              v48 = v47;
              -[SKNode alpha](v5, "alpha");
              v49 = v48;
              *(float *)&v50 = v50;
              if ((COERCE_UNSIGNED_INT(v49 - *(float *)&v50) & 0x60000000) != 0)
                goto LABEL_21;
              v51 = -[SKNode isHidden](self, "isHidden");
              if (v51 != -[SKNode isHidden](v5, "isHidden")
                || (v52 = -[SKNode isUserInteractionEnabled](self, "isUserInteractionEnabled"),
                    v52 != -[SKNode isUserInteractionEnabled](v5, "isUserInteractionEnabled"))
                || (v53 = -[SKNode focusBehavior](self, "focusBehavior"),
                    v53 != -[SKNode focusBehavior](v5, "focusBehavior"))
                || (-[SKNode speed](self, "speed"),
                    v55 = v54,
                    -[SKNode speed](v5, "speed"),
                    v56 = v55,
                    *(float *)&v57 = v57,
                    (COERCE_UNSIGNED_INT(v56 - *(float *)&v57) & 0x60000000) != 0))
              {
LABEL_21:
                LOBYTE(v7) = 0;
              }
              else
              {
                v59 = -[SKNode isPaused](self, "isPaused");
                v7 = v59 ^ -[SKNode isPaused](v5, "isPaused") ^ 1;
              }

            }
            goto LABEL_24;
          }
LABEL_23:
          LOBYTE(v7) = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      -[SKNode name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKNode name](v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_23;
      goto LABEL_9;
    }
    LOBYTE(v7) = 0;
  }
LABEL_25:

  return v7;
}

+ (SKNode)node
{
  return (SKNode *)objc_alloc_init((Class)objc_opt_class());
}

+ (SKNode)nodeWithFileNamed:(NSString *)filename
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v4 = filename;
  SKGetResourceBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("sks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (SKGetResourceBundle(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "pathForResource:ofType:", v4, 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v23);
    v10 = v23;
    objc_msgSend(v9, "setRequiresSecureCoding:", 0);
    objc_msgSend(v9, "setDecodingFailurePolicy:", 0);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v9, "setDelegate:", v11);
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __28__SKNode_nodeWithFileNamed___block_invoke;
    v20 = &unk_1EA4FFA98;
    v22 = a1;
    v13 = v9;
    v21 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v17);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v14, *MEMORY[0x1E0CB2CD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "finishDecoding");
  }
  else
  {
    v15 = 0;
  }

  return (SKNode *)v15;
}

void __28__SKNode_nodeWithFileNamed___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *aClass;

  aClass = a2;
  if (objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", aClass))
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_opt_class();
    NSStringFromClass(aClass);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClass:forClassName:", v7, v8);

    *a4 = 1;
  }

}

+ (SKNode)nodeWithFileNamed:(NSString *)filename securelyWithClasses:(NSSet *)classes andError:(NSError *)error
{
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v7 = filename;
  SKGetResourceBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v7, CFSTR("sks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (SKGetResourceBundle(),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "pathForResource:ofType:", v7, 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v9, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, error);
    objc_msgSend(v12, "setDecodingFailurePolicy:", 1);
    objc_msgSend(v12, "setRequiresSecureCoding:", 0);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v12, "setDelegate:", v13);
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __57__SKNode_nodeWithFileNamed_securelyWithClasses_andError___block_invoke;
    v22 = &unk_1EA4FFA98;
    v24 = a1;
    v15 = v12;
    v23 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v19);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14, v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "decodeTopLevelObjectOfClasses:forKey:error:", v16, *MEMORY[0x1E0CB2CD0], error);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "finishDecoding");
  }
  else
  {
    v17 = 0;
  }

  return (SKNode *)v17;
}

void __57__SKNode_nodeWithFileNamed_securelyWithClasses_andError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *aClass;

  aClass = a2;
  if (objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", aClass))
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_opt_class();
    NSStringFromClass(aClass);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClass:forClassName:", v7, v8);

    *a4 = 1;
  }

}

- (void)_makeBackingNode
{
  SKCNode *v2;

  v2 = (SKCNode *)operator new();
  SKCNode::SKCNode(v2);
  return v2;
}

- (void)_backingNode
{
  return self->_skcNode;
}

- (SKNode)init
{
  SKNode *v2;
  SKNode *v3;
  uint64_t v4;
  NSMutableDictionary *userData;
  NSMutableDictionary *info;
  SKReachConstraints *reachConstraints;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKNode;
  v2 = -[SKNode init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[SKNode _makeBackingNode](v2, "_makeBackingNode");
    v3->_skcNode = (void *)v4;
    *(_QWORD *)(v4 + 8) = v3;
    -[SKNode _didMakeBackingNode](v3, "_didMakeBackingNode");
    userData = v3->_userData;
    v3->_userData = 0;

    info = v3->_info;
    v3->_info = 0;

    reachConstraints = v3->_reachConstraints;
    v3->_reachConstraints = 0;

    -[SKNode setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[SKNode setFocusBehavior:](v3, "setFocusBehavior:", 0);
    objc_storeWeak((id *)&v3->_parent, 0);
    v3->_version = 51000003;
    -[SKNode _initAccessibility](v3, "_initAccessibility");
  }
  return v3;
}

- (Class)swiftClassFromString:(id)a3 moduleName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v13);

  if (!v14)
  {
    objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", 0, 1, CFSTR("_"));
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_TtC%lu%@%lu%@"), objc_msgSend(v12, "length"), v12, objc_msgSend(v5, "length"), v5);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v17;
}

- (SKNode)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  SKNode *v10;
  SKNode *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *skcNode;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSMutableDictionary *keyedSubSprites;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSMutableDictionary *keyedActions;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  uint64_t v68;
  SKNode *v69;
  SKNode *v71;
  void *v72;
  NSString *aClassName;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  SKNode *v80;
  _QWORD v81[4];
  SKNode *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  objc_super v87;
  _BYTE v88[128];
  _QWORD v89[2];
  _QWORD v90[3];
  _QWORD v91[3];
  _BYTE v92[128];
  _QWORD v93[2];
  _QWORD v94[3];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[11];

  v97[9] = *MEMORY[0x1E0C80C00];
  v4 = aDecoder;
  v74 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v97[2] = objc_opt_class();
  v97[3] = objc_opt_class();
  v97[4] = objc_opt_class();
  v97[5] = objc_opt_class();
  v97[6] = objc_opt_class();
  v97[7] = objc_opt_class();
  v97[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addObjectsFromArray:", v5);

  -[NSCoder allowedClasses](v4, "allowedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "unionSet:", v6);

  -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v74, CFSTR("_info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PB_previewSKNodeCustomClassName")),
        (aClassName = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    aClassName = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v8 = NSClassFromString(aClassName);
  if (!v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PB_previewSKNodeCustomModuleName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKNode swiftClassFromString:moduleName:](self, "swiftClassFromString:moduleName:", aClassName, v9);
    if (!v8)
    {
      NSLog(CFSTR("Unable to load custom class '%@' from module '%@'"), aClassName, v9);

      goto LABEL_11;
    }

  }
  if (v8 != (objc_class *)objc_opt_class()
    && -[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
  {
    v71 = self;
    v10 = (SKNode *)objc_msgSend([v8 alloc], "initWithCoder:", v4);

    goto LABEL_41;
  }
LABEL_11:
  v87.receiver = self;
  v87.super_class = (Class)SKNode;
  v11 = -[SKNode init](&v87, sel_init);
  v10 = v11;
  if (v11)
  {
    v12 = -[SKNode _makeBackingNode](v11, "_makeBackingNode");
    v10->_skcNode = (void *)v12;
    *(_QWORD *)(v12 + 8) = v10;
    -[SKNode _didMakeBackingNode](v10, "_didMakeBackingNode");
    v13 = (void *)MEMORY[0x1E0C99E60];
    v96[0] = objc_opt_class();
    v96[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_constraints"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setConstraints:](v10, "setConstraints:", v16);

    v17 = (void *)MEMORY[0x1E0C99E60];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_reachConstraints"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setReachConstraints:](v10, "setReachConstraints:", v20);

    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v74, CFSTR("_userData"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setUserData:](v10, "setUserData:", v21);

    -[SKNode set_info:](v10, "set_info:", v7);
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setName:](v10, "setName:", v22);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_opacity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    -[SKNode setAlpha:](v10, "setAlpha:");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_position"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "CGPointValue");
      -[SKNode setPosition:](v10, "setPosition:");

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_zRotation"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      -[SKNode setZRotation:](v10, "setZRotation:");

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_xRotation"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      -[SKNode setXRotation:](v10, "setXRotation:");

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_yRotation"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      -[SKNode setYRotation:](v10, "setYRotation:");

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_xScale"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      -[SKNode setXScale:](v10, "setXScale:");

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_yScale"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      -[SKNode setYScale:](v10, "setYScale:");

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_zPosition"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      -[SKNode setZPosition:](v10, "setZPosition:");

    }
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoint"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "CGPointValue");
    -[SKNode set_anchorPoint:](v10, "set_anchorPoint:");

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hidden"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setHidden:](v10, "setHidden:", objc_msgSend(v32, "BOOLValue"));

    skcNode = v10->_skcNode;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_skcPaused"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void *, uint64_t))(*(_QWORD *)skcNode + 160))(skcNode, objc_msgSend(v34, "BOOLValue"));

    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v74, CFSTR("_PKPhysicsBody"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setPhysicsBody:](v10, "setPhysicsBody:", v35);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v94[0] = objc_opt_class();
    v94[1] = objc_opt_class();
    v94[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("_attributeValues"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode setAttributeValues:](v10, "setAttributeValues:", v39);

    v40 = (void *)MEMORY[0x1E0C99E60];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("_children"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v43 = v72;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v84 != v45)
              objc_enumerationMutation(v43);
            v47 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[SKNode addChild:](v10, "addChild:", v47);
          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        }
        while (v44);
      }

      v48 = (void *)MEMORY[0x1E0C99E60];
      v91[0] = objc_opt_class();
      v91[1] = objc_opt_class();
      v91[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setWithArray:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v50, CFSTR("_keyedSubSprites"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = objc_opt_new();
        keyedSubSprites = v10->_keyedSubSprites;
        v10->_keyedSubSprites = (NSMutableDictionary *)v52;

        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __24__SKNode_initWithCoder___block_invoke;
        v81[3] = &unk_1EA4FFAC0;
        v82 = v10;
        objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v81);

      }
    }
    v54 = (void *)MEMORY[0x1E0C99E60];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    v90[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 3);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWithArray:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("_keyedActions"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = objc_opt_new();
      keyedActions = v10->_keyedActions;
      v10->_keyedActions = (NSMutableDictionary *)v58;

      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __24__SKNode_initWithCoder___block_invoke_2;
      v79[3] = &unk_1EA4FFAE8;
      v80 = v10;
      objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v79);

    }
    v60 = (void *)MEMORY[0x1E0C99E60];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setWithArray:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("_actions"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v64 = v63;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
      if (v65)
      {
        v66 = *(_QWORD *)v76;
        do
        {
          for (j = 0; j != v65; ++j)
          {
            if (*(_QWORD *)v76 != v66)
              objc_enumerationMutation(v64);
            v68 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[SKNode _runAction:](v10, "_runAction:", v68);
          }
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
        }
        while (v65);
      }

    }
    -[SKNode _initAccessibility](v10, "_initAccessibility");

  }
LABEL_41:
  v69 = v10;

  return v69;
}

void __24__SKNode_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v5, v6);
  }

}

void __24__SKNode_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v5, v6);
  }

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  id v36;

  v36 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v4, CFSTR("_version"));

  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[SKNode position](self, "position");
  objc_msgSend(v5, "valueWithCGPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v6, CFSTR("_position"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode alpha](self, "alpha");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v8, CFSTR("_opacity"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode xRotation](self, "xRotation");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v10, CFSTR("_xRotation"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode yRotation](self, "yRotation");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v12, CFSTR("_yRotation"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode zRotation](self, "zRotation");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v14, CFSTR("_zRotation"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode xScale](self, "xScale");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v16, CFSTR("_xScale"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode yScale](self, "yScale");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v18, CFSTR("_yScale"));

  -[SKNode name](self, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v19, CFSTR("_name"));

  -[SKNode userData](self, "userData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v20, CFSTR("_userData"));

  -[SKNode _info](self, "_info");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v21, CFSTR("_info"));

  -[SKNode constraints](self, "constraints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  objc_msgSend(v36, "encodeObject:forKey:", v23, CFSTR("_constraints"));

  -[SKNode reachConstraints](self, "reachConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v24, CFSTR("_reachConstraints"));

  -[SKNode children](self, "children");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  objc_msgSend(v36, "encodeObject:forKey:", v26, CFSTR("_children"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKNode isHidden](self, "isHidden"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v27, CFSTR("_hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKNode isPaused](self, "isPaused"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v28, CFSTR("_paused"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)self->_skcNode + 172));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v29, CFSTR("_skcPaused"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[SKNode zPosition](self, "zPosition");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v31, CFSTR("_zPosition"));

  objc_msgSend(v36, "encodeObject:forKey:", self->_actions, CFSTR("_actions"));
  objc_msgSend(v36, "encodeObject:forKey:", self->_keyedActions, CFSTR("_keyedActions"));
  objc_msgSend(v36, "encodeObject:forKey:", self->_keyedSubSprites, CFSTR("_keyedSubSprites"));
  -[SKNode physicsBody](self, "physicsBody");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v32, CFSTR("_PKPhysicsBody"));

  -[SKNode attributeValues](self, "attributeValues");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v33, CFSTR("_attributeValues"));

  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "encodeObject:forKey:", v35, CFSTR("_originalClass"));

}

- (id)copy
{
  return -[SKNode copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  SKCAction *v36;
  _QWORD *v37;
  uint64_t v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  if (-[NSMutableArray count](self->_children, "count")
    && -[NSMutableDictionary count](self->_keyedSubSprites, "count"))
  {
    v5 = (void *)-[NSMutableDictionary copy](self->_keyedSubSprites, "copy");
    v6 = (void *)-[NSMutableArray copy](self->_children, "copy");
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsInArray:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", v5, 1);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v6, 1);

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v68 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addChild:withKey:", v15, v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v11);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v64 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(v4, "addChild:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v17);
    }

  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_children, 1);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v16 = v20;
    v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v60 != v22)
            objc_enumerationMutation(v16);
          objc_msgSend(v4, "addChild:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
        }
        v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v21);
    }
    v8 = v16;
  }

  if (-[NSMutableArray count](self->_actions, "count") || -[NSMutableDictionary count](self->_keyedActions, "count"))
  {
    v24 = (void *)-[NSMutableDictionary copy](self->_keyedActions, "copy");
    v25 = (void *)-[NSMutableArray mutableCopy](self->_actions, "mutableCopy");
    objc_msgSend(v24, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectsInArray:", v26);

    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v24, 1);
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v25, 1);

    objc_msgSend(v27, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "addObjectsFromArray:", v28);

    objc_storeStrong(v4 + 6, obj);
    v29 = objc_msgSend(v27, "mutableCopy");
    v30 = v4[7];
    v4[7] = (id)v29;

    v31 = objc_msgSend(v4, "_backingNode");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v32 = v4[6];
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v56;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v56 != v34)
            objc_enumerationMutation(v32);
          v36 = (SKCAction *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * m), "caction");
          v37 = operator new(0x18uLL);
          v37[2] = v36;
          v38 = *(_QWORD *)(v31 + 176);
          *v37 = v38;
          v37[1] = v31 + 176;
          *(_QWORD *)(v38 + 8) = v37;
          *(_QWORD *)(v31 + 176) = v37;
          ++*(_QWORD *)(v31 + 192);
          (*((void (**)(SKCAction *, float))v36->var0 + 5))(v36, *(float *)(v31 + 168));
          v39 = skCurrentTime();
          SKCAction::wasAddedToTargetAtTime(v36, (SKCNode *)v31, v39);
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
      }
      while (v33);
    }

  }
  else
  {
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_actions, 1);
    v27 = v4[6];
    v4[6] = (id)v53;
  }

  -[SKNode xScale](self, "xScale");
  objc_msgSend(v4, "setXScale:");
  -[SKNode yScale](self, "yScale");
  objc_msgSend(v4, "setYScale:");
  -[SKNode position](self, "position");
  objc_msgSend(v4, "setPosition:");
  -[SKNode zRotation](self, "zRotation");
  objc_msgSend(v4, "setZRotation:");
  -[SKNode zPosition](self, "zPosition");
  objc_msgSend(v4, "setZPosition:");
  -[SKNode speed](self, "speed");
  objc_msgSend(v4, "setSpeed:");
  objc_msgSend(v4, "setPaused:", -[SKNode isPaused](self, "isPaused"));
  objc_msgSend(v4, "setHidden:", -[SKNode isHidden](self, "isHidden"));
  objc_msgSend(v4, "setUserInteractionEnabled:", -[SKNode isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  objc_msgSend(v4, "setFocusBehavior:", -[SKNode focusBehavior](self, "focusBehavior"));
  -[SKNode alpha](self, "alpha");
  objc_msgSend(v4, "setAlpha:");
  -[SKNode physicsBody](self, "physicsBody");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copy");
  objc_msgSend(v4, "setPhysicsBody:", v41);

  -[SKNode name](self, "name");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v42);

  -[SKNode userData](self, "userData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "mutableCopy");
  objc_msgSend(v4, "setUserData:", v44);

  -[SKNode _info](self, "_info");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "mutableCopy");
  objc_msgSend(v4, "set_info:", v46);

  -[SKNode reachConstraints](self, "reachConstraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setReachConstraints:", v48);

  -[SKNode constraints](self, "constraints");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  objc_msgSend(v4, "setConstraints:", v50);

  -[SKNode _anchorPoint](self, "_anchorPoint");
  objc_msgSend(v4, "set_anchorPoint:");
  -[SKNode attributeValues](self, "attributeValues");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributeValues:", v51);

  return v4;
}

- (void)removeFromParent
{
  SKNode **p_parent;
  id WeakRetained;
  char isKindOfClass;
  id v6;
  char v7;
  void *v8;
  id v9;
  id v10;

  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_parent);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v6 = objc_loadWeakRetained((id *)p_parent);
    v10 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "removeChild:", self);
    }
    else
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass();

      if ((v7 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)p_parent);
        objc_msgSend(v10, "removeChild:", self);
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0C99DA0];
        v10 = objc_loadWeakRetained((id *)p_parent);
        objc_msgSend(v8, "raise:format:", CFSTR("Attemped to remove node from invalid parent"), CFSTR("Attemped to remove node %@ from invalid parent %@"), self, v10);
      }
    }

  }
}

- (void)moveToParent:(SKNode *)parent
{
  SKNode *WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  SKNode *v9;

  v9 = parent;
  WeakRetained = (SKNode *)objc_loadWeakRetained((id *)&self->_parent);

  if (WeakRetained != v9)
  {
    -[SKNode convertPoint:toNode:](self, "convertPoint:toNode:", v9, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v6 = v5;
    v8 = v7;
    -[SKNode removeFromParent](self, "removeFromParent");
    -[SKNode setPosition:](self, "setPosition:", v6, v8);
    -[SKNode addChild:](v9, "addChild:", self);
  }

}

- (void)_update:(double)a3
{
  (*(void (**)(void *, double, float))(*(_QWORD *)self->_skcNode + 152))(self->_skcNode, a3, 1.0);
}

- (SKScene)scene
{
  void *skcNode;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  skcNode = self->_skcNode;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __15__SKNode_scene__block_invoke;
  v5[3] = &unk_1EA4FE920;
  v5[4] = &v6;
  SKCNode::walkUp((uint64_t)skcNode, v5, 1);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKScene *)v3;
}

void __15__SKNode_scene__block_invoke(uint64_t a1, id *lpsrc, _BYTE *a3)
{
  if (lpsrc
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), lpsrc[1]);
      *a3 = 1;
    }
  }
}

- (SKNode)parent
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = WeakRetained;
  else
    v3 = 0;

  return (SKNode *)v3;
}

- (CGPath)outline
{
  CGPath *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  PKPath *v7;
  std::__shared_weak_count *v8;

  (*(void (**)(PKPath **__return_ptr))(*(_QWORD *)self->_skcNode + 136))(&v7);
  if (v7)
  {
    v2 = (CGPath *)*((_QWORD *)v7 + 4);
    if (!v2)
    {
      PKPath::createPath(v7);
      v2 = (CGPath *)*((_QWORD *)v7 + 4);
    }
  }
  else
  {
    v2 = 0;
  }
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v2;
}

- (BOOL)inParentHierarchy:(SKNode *)parent
{
  SKNode *v4;
  SKNode *WeakRetained;
  id *p_isa;
  BOOL v7;
  id *v9;

  v4 = parent;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = (SKNode *)objc_loadWeakRetained((id *)&self->_parent);
    p_isa = (id *)&WeakRetained->super.super.isa;
    v7 = WeakRetained != 0;
    if (WeakRetained != v4 && WeakRetained != 0)
    {
      do
      {
        v9 = p_isa;
        p_isa = (id *)objc_loadWeakRetained(p_isa + 4);

        v7 = p_isa != 0;
      }
      while (p_isa != (id *)v4 && p_isa != 0);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addChild:(SKNode *)node
{
  SKNode *v4;

  v4 = node;
  -[SKNode insertChild:atIndex:](self, "insertChild:atIndex:", v4, -[NSMutableArray count](self->_children, "count"));

}

- (void)insertChild:(SKNode *)node atIndex:(NSInteger)index
{
  SKNode *v6;
  id *p_isa;
  id WeakRetained;
  NSMutableArray *v9;
  NSMutableArray *children;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v6 = node;
  p_isa = (id *)&v6->super.super.isa;
  if (self->_children)
  {
    if (v6)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Attemped to add nil node"), CFSTR("Attemped to add nil node to parent: %@"), self);
    goto LABEL_21;
  }
  v9 = (NSMutableArray *)objc_opt_new();
  children = self->_children;
  self->_children = v9;

  if (!p_isa)
    goto LABEL_6;
LABEL_3:
  WeakRetained = objc_loadWeakRetained(p_isa + 4);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attemped to add a SKNode which already has a parent: %@"), p_isa);
  }
  else
  {
    objc_msgSend(p_isa, "setParent:", self);
    -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
    SKCNode::insertChildAtIndex((SKCNode *)self->_skcNode, (SKCNode *)objc_msgSend(p_isa, "_backingNode"), index);
    -[NSMutableArray insertObject:atIndex:](self->_children, "insertObject:atIndex:", p_isa, index);
    -[SKNode scene](self, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(p_isa, "physicsBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "physicsWorld");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa, "physicsBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addBody:", v14);

        v15 = objc_msgSend(p_isa, "_backingNode");
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 200))(v15);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = p_isa;
        objc_msgSend(v11, "physicsWorld");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "field");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addField:", v18);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(p_isa, "_connectToScene:", v11);
      objc_msgSend(p_isa, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19 && objc_msgSend(v19, "count"))
        objc_msgSend(v11, "_registerConstraintsForNode:", p_isa);
      if (objc_msgSend(p_isa, "hasChildren"))
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __30__SKNode_insertChild_atIndex___block_invoke;
        v21[3] = &unk_1EA4FF760;
        v22 = v11;
        objc_msgSend(p_isa, "enumerateChildNodesWithName:usingBlock:", CFSTR(".//SKNode"), v21);

      }
    }
    -[SKNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("children"));

  }
LABEL_21:

}

void __30__SKNode_insertChild_atIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "physicsBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "physicsWorld");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "physicsBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addBody:", v5);

    v6 = objc_msgSend(v12, "_backingNode");
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v6);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v12;
    objc_msgSend(*(id *)(a1 + 32), "physicsWorld");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addField:", v9);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "_connectToScene:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v12, "constraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_registerConstraintsForNode:", v12);

}

- (CGRect)frame
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  float32x4_t AABB;
  float32x4_t v7;
  float32x4_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  simd_float4x4 v13;
  CGRect result;

  *(double *)v2.i64 = (*(double (**)(void *, SEL))(*(_QWORD *)self->_skcNode + 120))(self->_skcNode, a2);
  v13.columns[0] = v2;
  v13.columns[1] = v3;
  v13.columns[2] = v4;
  v13.columns[3] = v5;
  AABB = SKCBoundingBoxGetAABB(&v13);
  v7 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  v8 = vdivq_f32(vrndxq_f32(vmulq_f32(AABB, v7)), v7);
  v9 = v8.f32[0];
  v10 = v8.f32[1];
  v11 = v8.f32[2];
  v12 = v8.f32[3];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)removeChildAtIndex:(int64_t)a3
{
  SKScene *v5;
  SKNode *v6;

  -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
  -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", a3);
  v6 = (SKNode *)objc_claimAutoreleasedReturnValue();
  -[SKNode scene](self, "scene");
  v5 = (SKScene *)objc_claimAutoreleasedReturnValue();
  _removeChild(self, v6, v5);

  -[NSMutableArray removeObjectAtIndex:](self->_children, "removeObjectAtIndex:", a3);
  -[SKNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("children"));

}

- (void)removeChild:(id)a3
{
  SKScene *v4;
  SKNode *v5;

  v5 = (SKNode *)a3;
  if (v5)
  {
    -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
    -[SKNode scene](self, "scene");
    v4 = (SKScene *)objc_claimAutoreleasedReturnValue();
    _removeChild(self, v5, v4);

    -[NSMutableArray removeExactObject:](self->_children, "removeExactObject:", v5);
    -[SKNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("children"));
  }

}

- (void)removeChildrenInArray:(NSArray *)nodes
{
  NSArray *v4;
  void *v5;
  SKNode *v6;
  NSArray *v7;
  SKScene *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  SKNode *v14;
  SKNode *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NSArray *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = nodes;
  if (v4 && self->_children)
  {
    v23 = v4;
    -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
    -[SKNode scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self;
    v7 = v4;
    v8 = v5;
    -[SKScene _pkPhysicsWorld](v8, "_pkPhysicsWorld", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v7;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v10);
          v14 = *(SKNode **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[SKNode parent](v14, "parent");
          v15 = (SKNode *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == v6;

          if (v16)
          {
            objc_msgSend(v9, "addObject:", v14);
            _removeChild(v6, v14, v8);
          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    if ((objc_msgSend(v24, "hasBodies") & 1) != 0
      || (objc_msgSend(v24, "hasFields") & 1) != 0
      || -[SKScene _hasConstraints](v8, "_hasConstraints")
      || (-[SKScene avAudioEnvironmentNode](v8, "avAudioEnvironmentNode"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = v17 == 0,
          v17,
          !v18))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = v9;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v19);
            _unhookPhysicsAndConstraints(*(SKNode **)(*((_QWORD *)&v25 + 1) + 8 * j), v8);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v20);
      }

    }
    v4 = v23;
    -[NSMutableArray removeExactObjectsInArray:](self->_children, "removeExactObjectsInArray:", v10);
    -[SKNode didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("children"));
  }

}

- (void)removeAllChildren
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_children)
  {
    -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
    -[NSMutableDictionary removeAllObjects](self->_keyedSubSprites, "removeAllObjects");
    v3 = (void *)-[NSMutableArray copy](self->_children, "copy");
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          -[SKNode removeChild:](self, "removeChild:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[SKNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("children"));
  }
}

- (void)setConstraints:(NSArray *)constraints
{
  NSArray *v4;
  NSArray *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;

  v8 = constraints;
  v4 = (NSArray *)-[NSArray copy](v8, "copy");
  v5 = self->_constraints;
  self->_constraints = v4;

  -[SKNode scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = self->_constraints;
    if (v7 && -[NSArray count](v7, "count"))
      objc_msgSend(v6, "_registerConstraintsForNode:", self);
    else
      objc_msgSend(v6, "_removeConstraintsForNode:", self);
  }
  SKCNode::recomputeFlags((SKCNode *)self->_skcNode, 1);

}

- (NSArray)constraints
{
  return (NSArray *)(id)-[NSArray copy](self->_constraints, "copy");
}

- (void)addChild:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *keyedSubSprites;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_keyedSubSprites, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_keyedSubSprites, "removeObjectForKey:", v6);
      -[SKNode removeChild:](self, "removeChild:", v7);
    }
    if (v11)
    {
      -[SKNode addChild:](self, "addChild:", v11);
      keyedSubSprites = self->_keyedSubSprites;
      if (!keyedSubSprites)
      {
        v9 = (NSMutableDictionary *)objc_opt_new();
        v10 = self->_keyedSubSprites;
        self->_keyedSubSprites = v9;

        keyedSubSprites = self->_keyedSubSprites;
      }
      -[NSMutableDictionary setObject:forKey:](keyedSubSprites, "setObject:forKey:", v11, v6);
    }

  }
}

- (SKNode)childNodeWithName:(NSString *)name
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__SKNode_childNodeWithName___block_invoke;
  v5[3] = &unk_1EA4FFB10;
  v5[4] = &v6;
  -[SKNode enumerateChildNodesWithName:usingBlock:](self, "enumerateChildNodesWithName:usingBlock:", name, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKNode *)v3;
}

void __28__SKNode_childNodeWithName___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  *a3 = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)enumerateChildNodesWithName:(NSString *)name usingBlock:(void *)block
{
  char v4;

  v4 = 0;
  -[SKNode _enumerateChildNodesWithName:usingBlock:stopPointer:](self, "_enumerateChildNodesWithName:usingBlock:stopPointer:", name, block, &v4);
}

- (NSArray)objectForKeyedSubscript:(NSString *)name
{
  NSString *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  char v10;

  v4 = name;
  v10 = 0;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__SKNode_objectForKeyedSubscript___block_invoke;
  v8[3] = &unk_1EA4FF760;
  v6 = v5;
  v9 = v6;
  -[SKNode _enumerateChildNodesWithName:usingBlock:stopPointer:](self, "_enumerateChildNodesWithName:usingBlock:stopPointer:", v4, v8, &v10);

  return (NSArray *)v6;
}

uint64_t __34__SKNode_objectForKeyedSubscript___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_enumerateChildNodesWithName:(id)a3 usingBlock:(id)a4 stopPointer:(BOOL *)a5
{
  id v8;
  SKNode *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  _DWORD *v16;
  _DWORD *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  _DWORD *v30;
  void **v31;
  uint64_t v32;
  void **v33;
  int v34;
  void *v35;
  _DWORD *v36;
  id v37;
  _DWORD *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void **v43;
  int v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void **v50;
  int v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  id v61;
  _DWORD *v62;
  void **v63;
  uint64_t v64;
  void **v65;
  int v66;
  void *v67;
  unint64_t v68;
  uint64_t v69;
  BOOL *v70;
  id v71;
  id v72;
  _QWORD v73[3];
  void **v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void **v80;
  _DWORD *v81;
  unint64_t v82;
  void **v83;
  void **v84;
  _DWORD *v85;
  unint64_t v86;
  unint64_t *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v8 = a4;
  if (!*a5)
  {
    v71 = v8;
    v9 = self;
    objc_msgSend(v72, "componentsSeparatedByString:", CFSTR("/"));
    v80 = 0;
    v81 = 0;
    v82 = 0;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    v70 = a5;
    if (!v11)
      goto LABEL_67;
    v12 = *(_QWORD *)v77;
    v13 = 1;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v77 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v14);
        if (objc_msgSend(v15, "length", v70))
        {
          if (objc_msgSend(v15, "isEqualToString:", CFSTR(".")))
          {
            v16 = v81;
            if ((unint64_t)v81 >= v82)
            {
              v23 = ((char *)v81 - (char *)v80) >> 4;
              v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 60)
                std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
              v25 = v82 - (_QWORD)v80;
              if ((uint64_t)(v82 - (_QWORD)v80) >> 3 > v24)
                v24 = v25 >> 3;
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0)
                v26 = 0xFFFFFFFFFFFFFFFLL;
              else
                v26 = v24;
              v87 = &v82;
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v26);
              v29 = &v27[16 * v23];
              *(_DWORD *)v29 = 0;
              *((_QWORD *)v29 + 1) = 0;
              v31 = v80;
              v30 = v81;
              v32 = (uint64_t)v29;
              if (v81 != (_DWORD *)v80)
              {
                v33 = (void **)v81;
                do
                {
                  v34 = *((_DWORD *)v33 - 4);
                  v33 -= 2;
                  *(_DWORD *)(v32 - 16) = v34;
                  v32 -= 16;
                  v35 = v33[1];
                  v33[1] = 0;
                  *(_QWORD *)(v32 + 8) = v35;
                }
                while (v33 != v31);
              }
              goto LABEL_51;
            }
            *v81 = 0;
            *((_QWORD *)v16 + 1) = 0;
            v17 = v16 + 4;
            goto LABEL_52;
          }
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("..")))
          {
            v21 = v81;
            if ((unint64_t)v81 < v82)
            {
              v22 = 2;
              goto LABEL_19;
            }
            v46 = ((char *)v81 - (char *)v80) >> 4;
            v47 = v46 + 1;
            if ((unint64_t)(v46 + 1) >> 60)
              std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
            v48 = v82 - (_QWORD)v80;
            if ((uint64_t)(v82 - (_QWORD)v80) >> 3 > v47)
              v47 = v48 >> 3;
            if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0)
              v49 = 0xFFFFFFFFFFFFFFFLL;
            else
              v49 = v47;
            v87 = &v82;
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v49);
            v29 = &v27[16 * v46];
            *(_DWORD *)v29 = 2;
            *((_QWORD *)v29 + 1) = 0;
            v31 = v80;
            v30 = v81;
            v32 = (uint64_t)v29;
            if (v81 != (_DWORD *)v80)
            {
              v50 = (void **)v81;
              do
              {
                v51 = *((_DWORD *)v50 - 4);
                v50 -= 2;
                *(_DWORD *)(v32 - 16) = v51;
                v32 -= 16;
                v52 = v50[1];
                v50[1] = 0;
                *(_QWORD *)(v32 + 8) = v52;
              }
              while (v50 != v31);
            }
LABEL_51:
            v17 = v29 + 16;
            v80 = (void **)v32;
            v81 = v29 + 16;
            v53 = v82;
            v82 = (unint64_t)&v27[16 * v28];
            v83 = v31;
            v85 = v30;
            v86 = v53;
            v84 = v31;
            std::__split_buffer<Token>::~__split_buffer((uint64_t)&v83);
            goto LABEL_52;
          }
          Token::Token((Token *)&v74, (NSString *)v15);
          v36 = v81;
          if ((unint64_t)v81 >= v82)
          {
            v54 = ((char *)v81 - (char *)v80) >> 4;
            v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 60)
              std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
            v56 = v82 - (_QWORD)v80;
            if ((uint64_t)(v82 - (_QWORD)v80) >> 3 > v55)
              v55 = v56 >> 3;
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF0)
              v57 = 0xFFFFFFFFFFFFFFFLL;
            else
              v57 = v55;
            v87 = &v82;
            v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v57);
            v60 = &v58[16 * v54];
            *(_DWORD *)v60 = (_DWORD)v74;
            v61 = v75;
            v75 = 0;
            *((_QWORD *)v60 + 1) = v61;
            v63 = v80;
            v62 = v81;
            v64 = (uint64_t)v60;
            if (v81 != (_DWORD *)v80)
            {
              v65 = (void **)v81;
              do
              {
                v66 = *((_DWORD *)v65 - 4);
                v65 -= 2;
                *(_DWORD *)(v64 - 16) = v66;
                v64 -= 16;
                v67 = v65[1];
                v65[1] = 0;
                *(_QWORD *)(v64 + 8) = v67;
              }
              while (v65 != v63);
            }
            v38 = v60 + 16;
            v80 = (void **)v64;
            v81 = v60 + 16;
            v68 = v82;
            v82 = (unint64_t)&v58[16 * v59];
            v83 = v63;
            v85 = v62;
            v86 = v68;
            v84 = v63;
            std::__split_buffer<Token>::~__split_buffer((uint64_t)&v83);
          }
          else
          {
            *v81 = (_DWORD)v74;
            v37 = v75;
            v75 = 0;
            *((_QWORD *)v36 + 1) = v37;
            v38 = v36 + 4;
          }
          v81 = v38;

        }
        else
        {
          if ((v13 & 1) == 0)
          {
            v21 = v81;
            if ((unint64_t)v81 >= v82)
            {
              v39 = ((char *)v81 - (char *)v80) >> 4;
              v40 = v39 + 1;
              if ((unint64_t)(v39 + 1) >> 60)
                std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
              v41 = v82 - (_QWORD)v80;
              if ((uint64_t)(v82 - (_QWORD)v80) >> 3 > v40)
                v40 = v41 >> 3;
              if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0)
                v42 = 0xFFFFFFFFFFFFFFFLL;
              else
                v42 = v40;
              v87 = &v82;
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v42);
              v29 = &v27[16 * v39];
              *(_DWORD *)v29 = 1;
              *((_QWORD *)v29 + 1) = 0;
              v31 = v80;
              v30 = v81;
              v32 = (uint64_t)v29;
              if (v81 != (_DWORD *)v80)
              {
                v43 = (void **)v81;
                do
                {
                  v44 = *((_DWORD *)v43 - 4);
                  v43 -= 2;
                  *(_DWORD *)(v32 - 16) = v44;
                  v32 -= 16;
                  v45 = v43[1];
                  v43[1] = 0;
                  *(_QWORD *)(v32 + 8) = v45;
                }
                while (v43 != v31);
              }
              goto LABEL_51;
            }
            v22 = 1;
LABEL_19:
            *v21 = v22;
            *((_QWORD *)v21 + 1) = 0;
            v17 = v21 + 4;
LABEL_52:
            v81 = v17;
            goto LABEL_53;
          }
          while (1)
          {
            -[SKNode parent](v9, "parent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

            if (v19)
              break;
            -[SKNode parent](v9, "parent");
            v20 = objc_claimAutoreleasedReturnValue();

            v9 = (SKNode *)v20;
          }
        }
LABEL_53:
        v13 = 0;
        ++v14;
      }
      while (v14 != v11);
      v69 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
      v11 = v69;
      v13 = 0;
      if (!v69)
      {
LABEL_67:

        v84 = 0;
        v85 = 0;
        v83 = (void **)&v84;
        memset(v73, 0, sizeof(v73));
        std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v73, (uint64_t)v80, (uint64_t)v81, ((char *)v81 - (char *)v80) >> 4);
        -[SKNode _processSearchTokens:visited:usingBlock:stopPointer:](v9, "_processSearchTokens:visited:usingBlock:stopPointer:", v73, &v83, v71, v70);
        v74 = (void **)v73;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100](&v74);
        std::__tree<SKNode * {__strong}>::destroy((uint64_t)&v83, v84);
        v83 = (void **)&v80;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100](&v83);

        v8 = v71;
        break;
      }
    }
  }

}

- (void)_processSearchTokens:()vector<Token visited:(std:(void *)a4 :(id)a5 allocator<Token>> *)a3 usingBlock:(BOOL *)a6 stopPointer:
{
  void (**v10)(id, id *, BOOL *);
  SKNode *v11;
  id *p_isa;
  Token *var1;
  Token *var0;
  int v15;
  Token *v16;
  id *v17;
  void **v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  BOOL v22;
  _QWORD *v23;
  id *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  id *v32;
  id *v33;
  Token *v34;
  id *v35;
  id v36;
  Token *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  NSString *v43;
  Token *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  void *v50;
  id *v51;
  id *v52;
  _QWORD *v53;
  _QWORD *v54;
  unint64_t v55;
  BOOL v56;
  _QWORD *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t i;
  void **v64;
  _QWORD *v65;
  char *v66;
  unint64_t v67;
  BOOL v68;
  _QWORD *v69;
  char *v70;
  BOOL v71;
  NSString *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t j;
  void **v78;
  _QWORD *v79;
  char *v80;
  unint64_t v81;
  BOOL v82;
  _QWORD *v83;
  char *v84;
  BOOL v85;
  void (**v86)(id, id *, BOOL *);
  _QWORD v87[3];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[3];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[3];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  char *v113;
  char *v114;
  uint64_t v115;
  id *v116;
  char **v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, id *, BOOL *))a5;
  v11 = self;
  p_isa = (id *)&v11->super.super.isa;
  v116 = (id *)&v11->super.super.isa;
  var0 = a3->var0;
  var1 = a3->var1;
  v16 = (Token *)((char *)a3->var0 + 16);
  v15 = *(_DWORD *)a3->var0;
  if (v16 == var1)
  {
    switch(v15)
    {
      case 0:
        if (!*a6)
        {
          v19 = (_QWORD *)*((_QWORD *)a4 + 1);
          if (!v19)
            goto LABEL_74;
          v20 = (char *)a4 + 8;
          do
          {
            v21 = v19[4];
            v22 = v21 >= (unint64_t)v11;
            if (v21 >= (unint64_t)v11)
              v23 = v19;
            else
              v23 = v19 + 1;
            if (v22)
              v20 = v19;
            v19 = (_QWORD *)*v23;
          }
          while (*v23);
          if (v20 == (_QWORD *)((char *)a4 + 8) || v20[4] > (unint64_t)v11)
            goto LABEL_74;
        }
        break;
      case 2:
        -[SKNode parent](v11, "parent");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_msgSend(v116, "parent");
          v51 = (id *)objc_claimAutoreleasedReturnValue();
          v52 = v116;
          v116 = v51;

        }
        if (!*a6)
        {
          v53 = (_QWORD *)*((_QWORD *)a4 + 1);
          if (!v53)
            goto LABEL_74;
          v54 = (char *)a4 + 8;
          do
          {
            v55 = v53[4];
            v56 = v55 >= (unint64_t)v116;
            if (v55 >= (unint64_t)v116)
              v57 = v53;
            else
              v57 = v53 + 1;
            if (v56)
              v54 = v53;
            v53 = (_QWORD *)*v57;
          }
          while (*v57);
          if (v54 == (_QWORD *)((char *)a4 + 8) || (unint64_t)v116 < v54[4])
          {
LABEL_74:
            std::__tree<SKNode * {__strong}>::__emplace_unique_key_args<SKNode * {__strong},SKNode * const {__strong}&>((uint64_t **)a4, (unint64_t *)&v116, (id *)&v116);
            v10[2](v10, v116, a6);
          }
        }
        break;
      case 3:
        if (v11->_children)
        {
          v58 = *((id *)var0 + 1);
          v114 = 0;
          v113 = 0;
          v115 = 0;
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v59 = p_isa[5];
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
          if (v60)
          {
            v61 = *(_QWORD *)v110;
            v62 = (char *)a4 + 8;
            do
            {
              for (i = 0; i != v60; ++i)
              {
                if (*(_QWORD *)v110 != v61)
                  objc_enumerationMutation(v59);
                v64 = *(void ***)(*((_QWORD *)&v109 + 1) + 8 * i);
                v117 = (char **)v64;
                v65 = *(_QWORD **)v62;
                if (!*(_QWORD *)v62)
                  goto LABEL_139;
                v66 = (char *)a4 + 8;
                do
                {
                  v67 = v65[4];
                  v68 = v67 >= (unint64_t)v64;
                  if (v67 >= (unint64_t)v64)
                    v69 = v65;
                  else
                    v69 = v65 + 1;
                  if (v68)
                    v66 = (char *)v65;
                  v65 = (_QWORD *)*v69;
                }
                while (*v69);
                if (v66 == v62 || (unint64_t)v64 < *((_QWORD *)v66 + 4))
                {
LABEL_139:
                  if (SKNodeNameMatches(v58, v64))
                  {
                    std::__tree<SKNode * {__strong}>::__emplace_unique_key_args<SKNode * {__strong},SKNode * const {__strong}&>((uint64_t **)a4, (unint64_t *)&v117, (id *)&v117);
                    std::vector<UITouch * {__strong}>::push_back[abi:ne180100](&v113, (id *)&v117);
                  }
                }
              }
              v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
            }
            while (v60);
          }

          if (!*a6 && v113 != v114)
          {
            v70 = v113 + 8;
            do
            {
              v10[2](v10, *((id **)v70 - 1), a6);
              v71 = *a6 || v70 == v114;
              v70 += 8;
            }
            while (!v71);
          }
          v117 = &v113;
          std::vector<UITouch * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);

        }
        break;
      case 4:
        if (v11->_children)
        {
          v72 = (NSString *)*((id *)var0 + 1);
          v86 = v10;
          NSClassFromString(v72);
          v114 = 0;
          v113 = 0;
          v115 = 0;
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v73 = v116[5];
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
          if (v74)
          {
            v75 = *(_QWORD *)v106;
            v76 = (char *)a4 + 8;
            do
            {
              for (j = 0; j != v74; ++j)
              {
                if (*(_QWORD *)v106 != v75)
                  objc_enumerationMutation(v73);
                v78 = *(void ***)(*((_QWORD *)&v105 + 1) + 8 * j);
                v117 = (char **)v78;
                v79 = *(_QWORD **)v76;
                if (!*(_QWORD *)v76)
                  goto LABEL_123;
                v80 = (char *)a4 + 8;
                do
                {
                  v81 = v79[4];
                  v82 = v81 >= (unint64_t)v78;
                  if (v81 >= (unint64_t)v78)
                    v83 = v79;
                  else
                    v83 = v79 + 1;
                  if (v82)
                    v80 = (char *)v79;
                  v79 = (_QWORD *)*v83;
                }
                while (*v83);
                if (v80 == v76 || (unint64_t)v78 < *((_QWORD *)v80 + 4))
                {
LABEL_123:
                  if (SKNodeNameMatches(v72, v78) || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    std::__tree<SKNode * {__strong}>::__emplace_unique_key_args<SKNode * {__strong},SKNode * const {__strong}&>((uint64_t **)a4, (unint64_t *)&v117, (id *)&v117);
                    std::vector<UITouch * {__strong}>::push_back[abi:ne180100](&v113, (id *)&v117);
                  }
                }
              }
              v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
            }
            while (v74);
          }

          v10 = v86;
          if (!*a6 && v113 != v114)
          {
            v84 = v113 + 8;
            do
            {
              v86[2](v86, *((id **)v84 - 1), a6);
              v85 = *a6 || v84 == v114;
              v84 += 8;
            }
            while (!v85);
          }
          v117 = &v113;
          std::vector<UITouch * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);

        }
        break;
      default:
        break;
    }
  }
  else
  {
    switch(v15)
    {
      case 0:
        v114 = 0;
        v113 = 0;
        v115 = 0;
        std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)var1, (var1 - v16) >> 4);
        v17 = v116;
        memset(v104, 0, sizeof(v104));
        std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v104, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
        v18 = (void **)v104;
        objc_msgSend(v17, "_processSearchTokens:visited:usingBlock:stopPointer:", v104, a4, v10, a6);
        goto LABEL_34;
      case 1:
        if (!*a6)
        {
          v114 = 0;
          v113 = 0;
          v115 = 0;
          std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)var1, (var1 - v16) >> 4);
          v24 = v116;
          memset(v102, 0, sizeof(v102));
          std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v102, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
          objc_msgSend(v24, "_processSearchTokens:visited:usingBlock:stopPointer:", v102, a4, v10, a6);
          v117 = (char **)v102;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
          v117 = &v113;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
          p_isa = v116;
        }
        v25 = p_isa[5];
        if (v25)
        {
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v26 = v25;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v99;
            do
            {
              for (k = 0; k != v27; ++k)
              {
                if (*(_QWORD *)v99 != v28)
                  objc_enumerationMutation(v26);
                if (!*a6)
                {
                  v30 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
                  memset(v97, 0, sizeof(v97));
                  std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v97, (uint64_t)a3->var0, (uint64_t)a3->var1, (a3->var1 - a3->var0) >> 4);
                  objc_msgSend(v30, "_processSearchTokens:visited:usingBlock:stopPointer:", v97, a4, v10, a6);
                  v113 = (char *)v97;
                  std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v113);
                }
              }
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
            }
            while (v27);
          }

        }
        break;
      case 2:
        -[SKNode parent](v11, "parent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v116, "parent");
          v32 = (id *)objc_claimAutoreleasedReturnValue();
          v33 = v116;
          v116 = v32;

        }
        v34 = a3->var1;
        v115 = 0;
        v113 = 0;
        v114 = 0;
        std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)v34, (v34 - v16) >> 4);
        v35 = v116;
        memset(v103, 0, sizeof(v103));
        std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v103, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
        v18 = (void **)v103;
        objc_msgSend(v35, "_processSearchTokens:visited:usingBlock:stopPointer:", v103, a4, v10, a6);
LABEL_34:
        v117 = (char **)v18;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        v117 = &v113;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        break;
      case 3:
        if (v11->_children)
        {
          v36 = *((id *)var0 + 1);
          v37 = a3->var1;
          v115 = 0;
          v113 = 0;
          v114 = 0;
          std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)v37, (v37 - v16) >> 4);
          v95 = 0u;
          v96 = 0u;
          v94 = 0u;
          v93 = 0u;
          v38 = v116[5];
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v93, v119, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v94;
            do
            {
              for (m = 0; m != v39; ++m)
              {
                if (*(_QWORD *)v94 != v40)
                  objc_enumerationMutation(v38);
                if (!*a6)
                {
                  v42 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * m);
                  if (SKNodeNameMatches(v36, v42))
                  {
                    memset(v92, 0, sizeof(v92));
                    std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v92, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
                    objc_msgSend(v42, "_processSearchTokens:visited:usingBlock:stopPointer:", v92, a4, v10, a6);
                    v117 = (char **)v92;
                    std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
                  }
                }
              }
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v93, v119, 16);
            }
            while (v39);
          }

          v117 = &v113;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);

        }
        break;
      case 4:
        if (v11->_children)
        {
          v43 = (NSString *)*((id *)var0 + 1);
          NSClassFromString(v43);
          v44 = a3->var1;
          v115 = 0;
          v113 = 0;
          v114 = 0;
          std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)v44, (v44 - v16) >> 4);
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v45 = v116[5];
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v88, v118, 16);
          if (v46)
          {
            v47 = *(_QWORD *)v89;
            do
            {
              for (n = 0; n != v46; ++n)
              {
                if (*(_QWORD *)v89 != v47)
                  objc_enumerationMutation(v45);
                if (!*a6)
                {
                  v49 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * n);
                  if (SKNodeNameMatches(v43, v49) || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    memset(v87, 0, sizeof(v87));
                    std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v87, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
                    objc_msgSend(v49, "_processSearchTokens:visited:usingBlock:stopPointer:", v87, a4, v10, a6);
                    v117 = (char **)v87;
                    std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
                  }
                }
              }
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v88, v118, 16);
            }
            while (v46);
          }

          v117 = &v113;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);

        }
        break;
      default:
        break;
    }
  }

}

- (BOOL)hasChildren
{
  return -[NSMutableArray count](self->_children, "count") != 0;
}

- (NSArray)children
{
  NSMutableArray *children;

  children = self->_children;
  if (children)
    return (NSArray *)(id)-[NSMutableArray copy](children, "copy");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_descendants
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode _descendantsToMutableArray:](self, "_descendantsToMutableArray:", v3);
  return v3;
}

- (void)_descendantsToMutableArray:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v9, (_QWORD)v10);
        objc_msgSend(v9, "_descendantsToMutableArray:", v4);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)_descendantsWithPredicate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode _descendantsWithPredicate:toMutableArray:](self, "_descendantsWithPredicate:toMutableArray:", v4, v5);

  return v5;
}

- (void)_descendantsWithPredicate:(id)a3 toMutableArray:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_children;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v6[2](v6, v12))
          objc_msgSend(v7, "addObject:", v12, (_QWORD)v13);
        objc_msgSend(v12, "_descendantsWithPredicate:toMutableArray:", v6, v7, (_QWORD)v13);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)runAction:(SKAction *)action
{
  SKAction *v4;
  id v5;
  SKAction *v6;

  v4 = action;
  if (v4)
  {
    v6 = v4;
    v5 = -[SKAction copy](v4, "copy");
    -[SKNode _runAction:](self, "_runAction:", v5);

    v4 = v6;
  }

}

- (void)_runAction:(id)a3
{
  id v4;
  NSMutableArray *actions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  SKCAction *v8;
  _QWORD *skcNode;
  _QWORD *v10;
  uint64_t v11;
  SKCNode *v12;
  double v13;
  id v14;

  v4 = a3;
  actions = self->_actions;
  v14 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_actions;
    self->_actions = v6;

    actions = self->_actions;
    v4 = v14;
  }
  -[NSMutableArray addObject:](actions, "addObject:", v4);
  v8 = (SKCAction *)objc_msgSend(v14, "caction");
  (*((void (**)(SKCAction *, float))v8->var0 + 5))(v8, *((float *)self->_skcNode + 42));
  skcNode = self->_skcNode;
  v10 = operator new(0x18uLL);
  v10[2] = v8;
  v11 = skcNode[22];
  skcNode += 22;
  *v10 = v11;
  v10[1] = skcNode;
  *(_QWORD *)(v11 + 8) = v10;
  *skcNode = v10;
  ++skcNode[2];
  v12 = (SKCNode *)self->_skcNode;
  v13 = skCurrentTime();
  SKCAction::wasAddedToTargetAtTime(v8, v12, v13);
  SKCNode::recomputeFlags((SKCNode *)self->_skcNode, 1);

}

- (void)runAction:(SKAction *)action completion:(void *)block
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SKAction *v11;

  v11 = action;
  v6 = block;
  if (v11)
  {
    v7 = -[SKAction copy](v11, "copy");
    v8 = MEMORY[0x1DF0CFCB0](v6);
    v9 = objc_msgSend(v7, "caction");
    v10 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = v8;

    -[SKNode _runAction:](self, "_runAction:", v7);
  }

}

- (void)setSpeed:(CGFloat)speed
{
  float v3;
  float *skcNode;

  v3 = speed;
  skcNode = (float *)self->_skcNode;
  skcNode[42] = v3;
  SKCNode::recomputeFlags((SKCNode *)skcNode, 1);
}

- (CGFloat)speed
{
  return *((float *)self->_skcNode + 42);
}

- (CGFloat)alpha
{
  return *((float *)self->_skcNode + 81);
}

- (void)setAlpha:(CGFloat)alpha
{
  SKCNode *skcNode;
  float v4;
  float v5;

  skcNode = (SKCNode *)self->_skcNode;
  v4 = alpha;
  v5 = v4;
  SKCNode::setAlpha(skcNode, &v5);
}

- (void)runAction:(SKAction *)action withKey:(NSString *)key
{
  NSString *v6;
  id v7;
  NSMutableDictionary *keyedActions;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  SKAction *v11;

  v11 = action;
  v6 = key;
  if (v6)
  {
    -[SKNode removeActionForKey:](self, "removeActionForKey:", v6);
    if (v11)
    {
      v7 = -[SKAction copy](v11, "copy");
      keyedActions = self->_keyedActions;
      if (!keyedActions)
      {
        v9 = (NSMutableDictionary *)objc_opt_new();
        v10 = self->_keyedActions;
        self->_keyedActions = v9;

        keyedActions = self->_keyedActions;
      }
      -[NSMutableDictionary setObject:forKey:](keyedActions, "setObject:forKey:", v7, v6);
      -[SKNode _runAction:](self, "_runAction:", v7);

    }
  }

}

- (SKAction)actionForKey:(NSString *)key
{
  NSString *v4;
  void *v5;

  v4 = key;
  if (!v4)
    goto LABEL_4;
  -[NSMutableDictionary objectForKey:](self->_keyedActions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableArray containsObject:](self->_actions, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_keyedActions, "removeObjectForKey:", v4);

LABEL_4:
    v5 = 0;
  }

  return (SKAction *)v5;
}

- (void)removeActionForKey:(NSString *)key
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;

  v4 = key;
  if (v4)
  {
    v7 = v4;
    -[NSMutableDictionary objectForKey:](self->_keyedActions, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      SKCNode::removeAction((SKCNode *)self->_skcNode, (SKCAction *)objc_msgSend(v5, "caction"));
      -[NSMutableDictionary removeObjectForKey:](self->_keyedActions, "removeObjectForKey:", v7);
    }

    v4 = v7;
  }

}

- (void)removeAllActions
{
  NSMutableArray *actions;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  actions = self->_actions;
  if (actions)
  {
    v4 = (void *)-[NSMutableArray copy](actions, "copy");
    -[NSMutableDictionary removeAllObjects](self->_keyedActions, "removeAllObjects");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          SKCNode::removeAction((SKCNode *)self->_skcNode, (SKCAction *)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "caction", (_QWORD)v9));
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)containingView
{
  SKNode *v2;
  SKNode *v3;
  SKNode *v4;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[SKNode parent](v3, "parent");
      v4 = (SKNode *)objc_claimAutoreleasedReturnValue();

      v3 = v4;
      if (!v4)
        return v4;
    }
    -[SKNode view](v3, "view");
    v4 = (SKNode *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)hasActions
{
  return -[NSMutableArray count](self->_actions, "count") != 0;
}

- (BOOL)needsUpdate
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGPoint v14;
  CGRect v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode position](self, "position");
  NSStringFromCGPoint(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode xScale](self, "xScale");
  v8 = v7;
  -[SKNode yScale](self, "yScale");
  v10 = v9;
  -[SKNode calculateAccumulatedFrame](self, "calculateAccumulatedFrame");
  NSStringFromCGRect(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> name:'%@' position:%@ scale:{%.2f, %.2f} accumulatedFrame:%@"), v4, v5, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)setPhysicsBody:(SKPhysicsBody *)physicsBody
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKPhysicsBody *v9;

  v9 = physicsBody;
  if (*((SKPhysicsBody **)self->_skcNode + 29) != v9)
  {
    -[SKNode scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)self->_skcNode + 29);
    if (v6)
    {
      objc_msgSend(v6, "setRepresentedObject:", 0);
      if (v5)
      {
        objc_msgSend(v5, "physicsWorld");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeBody:", *((_QWORD *)self->_skcNode + 29));

      }
    }
    objc_storeStrong((id *)self->_skcNode + 29, physicsBody);
    if (v9)
    {
      -[SKPhysicsBody setRepresentedObject:](v9, "setRepresentedObject:", self);
      -[SKPhysicsBody setPostStepBlock:](v9, "setPostStepBlock:", &__block_literal_global_5);
      *((__n128 *)self->_skcNode + 15) = SKCNode::getScale((__n128 *)self->_skcNode);
      (*(void (**)(void *))(*(_QWORD *)self->_skcNode + 200))(self->_skcNode);
      if (v5)
      {
        objc_msgSend(v5, "physicsWorld");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addBody:", v9);

      }
    }
    SKCNode::recomputeFlags((SKCNode *)self->_skcNode, 1);

  }
}

- (SKPhysicsBody)physicsBody
{
  return (SKPhysicsBody *)*((id *)self->_skcNode + 29);
}

- (id)physicsField
{
  return 0;
}

- (CGPoint)position
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32((float32x2_t)SKCNode::getTranslation((__n128 *)self->_skcNode).n128_u64[0]);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setPosition:(CGPoint)position
{
  float y;

  *(float *)&position.x = position.x;
  y = position.y;
  SKCNode::setTranslation((SKCNode *)self->_skcNode, (__n128)position, y);
}

- (CGRect)calculateAccumulatedFrame
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  float32x4_t AABB;
  float32x4_t v6;
  float32x4_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  simd_float4x4 v12;
  CGRect result;

  v12.columns[0] = (simd_float4)SKCNode::getAccumulatedBoundingBox((char **)self->_skcNode);
  v12.columns[1] = v2;
  v12.columns[2] = v3;
  v12.columns[3] = v4;
  AABB = SKCBoundingBoxGetAABB(&v12);
  v6 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  v7 = vdivq_f32(vrndxq_f32(vmulq_f32(AABB, v6)), v6);
  v8 = v7.f32[0];
  v9 = v7.f32[1];
  v10 = v7.f32[2];
  v11 = v7.f32[3];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGFloat)zPosition
{
  return SKCNode::getZTranslation((SKCNode *)self->_skcNode);
}

- (void)setZPosition:(CGFloat)zPosition
{
  float v3;

  v3 = zPosition;
  SKCNode::setZTranslation((SKCNode *)self->_skcNode, v3);
}

- (CGFloat)zRotation
{
  return COERCE_FLOAT(SKCNode::getRotation((__n128 *)self[24]).n128_u32[2]);
}

- (void)setZRotation:(CGFloat)zRotation
{
  float v3;

  v3 = zRotation;
  SKCNode::setZRotation((SKCNode *)self->_skcNode, v3);
}

- (double)xRotation
{
  return SKCNode::getRotation((__n128 *)self->_skcNode).n128_f32[0];
}

- (void)setXRotation:(double)a3
{
  __n128 Rotation;
  float v6;

  Rotation = SKCNode::getRotation((__n128 *)self->_skcNode);
  v6 = a3;
  Rotation.n128_f32[0] = v6;
  SKCNode::setRotation((SKCNode *)self->_skcNode, Rotation);
}

- (double)yRotation
{
  return COERCE_FLOAT(SKCNode::getRotation((__n128 *)self[24]).n128_u32[1]);
}

- (void)setYRotation:(double)a3
{
  __n128 Rotation;
  float v6;

  Rotation = SKCNode::getRotation((__n128 *)self->_skcNode);
  v6 = a3;
  Rotation.n128_f32[1] = v6;
  SKCNode::setRotation((SKCNode *)self->_skcNode, Rotation);
}

- (CGFloat)xScale
{
  return SKCNode::getScale((__n128 *)self->_skcNode).n128_f32[0];
}

- (void)setXScale:(CGFloat)xScale
{
  __n128 Scale;
  float v6;

  -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("size"));
  Scale = SKCNode::getScale((__n128 *)self->_skcNode);
  v6 = xScale;
  Scale.n128_f32[0] = v6;
  SKCNode::setScale((SKCNode *)self->_skcNode, Scale);
  -[SKNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("size"));
}

- (CGFloat)yScale
{
  return COERCE_FLOAT(SKCNode::getScale((__n128 *)self[24]).n128_u32[1]);
}

- (void)setYScale:(CGFloat)yScale
{
  __n128 Scale;
  float v6;

  -[SKNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("size"));
  Scale = SKCNode::getScale((__n128 *)self->_skcNode);
  v6 = yScale;
  Scale.n128_f32[1] = v6;
  SKCNode::setScale((SKCNode *)self->_skcNode, Scale);
  -[SKNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("size"));
}

- (void)setScale:(CGFloat)scale
{
  -[SKNode setXScale:](self, "setXScale:");
  -[SKNode setYScale:](self, "setYScale:", scale);
}

- (BOOL)isHidden
{
  return *((_BYTE *)self->_skcNode + 280);
}

- (void)setHidden:(BOOL)hidden
{
  SKCNode::setHidden((SKCNode *)self->_skcNode, hidden);
}

- (BOOL)isPaused
{
  return *((_BYTE *)self->_skcNode + 172);
}

- (void)setPaused:(BOOL)paused
{
  _BYTE *skcNode;
  _BOOL8 v5;
  double v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  skcNode = self->_skcNode;
  if ((skcNode[172] != 0) != paused)
  {
    v5 = paused;
    (*(void (**)(_BYTE *, BOOL))(*(_QWORD *)skcNode + 160))(skcNode, paused);
    v6 = skCurrentTime();
    v7 = (void *)-[NSMutableArray copy](self->_actions, "copy");
    v8 = self->_children;
    if (*((_BYTE *)self->_skcNode + 172))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v13, "finished") & 1) == 0)
              SKCAction::wasPausedWithTargetAtTime((SKCAction *)objc_msgSend(v13, "caction"), (SKCNode *)self->_skcNode, v6);
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v10);
      }
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v7;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            if ((objc_msgSend(v18, "finished") & 1) == 0)
              SKCAction::willResumeWithTargetAtTime((SKCAction *)objc_msgSend(v18, "caction"), (SKCNode *)self->_skcNode, v6);
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v15);
      }
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v8;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v24;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * k), "setPaused:", v5, (_QWORD)v23);
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v20);
    }

  }
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
  self->_userInteractionEnabled = userInteractionEnabled;
}

- (BOOL)containsPoint:(CGPoint)p
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = p.y;
  x = p.x;
  -[SKNode calculateAccumulatedFrame](self, "calculateAccumulatedFrame");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (BOOL)containsPoint:(CGPoint)a3 withRadius:(double)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;

  y = a3.y;
  x = a3.x;
  -[SKNode calculateAccumulatedFrame](self, "calculateAccumulatedFrame");
  *(float *)&v9 = v9;
  *(float *)&v10 = v10;
  v11 = x;
  v12 = vabds_f32(v11, *(float *)&v9);
  v13 = *(float *)&v10 * 0.5;
  if (v13 + a4 < v12)
    return 0;
  v14 = v7;
  v15 = v8;
  v16 = y;
  v17 = vabds_f32(v16, v14);
  v18 = v15 * 0.5;
  if (v18 + a4 < v17)
    return 0;
  return v12 <= v13
      || v17 <= v18
      || a4 * a4 >= (float)((float)((float)(v17 - v13) * (float)(v17 - v13))
                          + (float)((float)(v12 - v18) * (float)(v12 - v18)));
}

- (id)nodeAtPoint:(CGPoint)a3 recursive:(BOOL)a4
{
  SKNode *v4;
  float32x4_t v5;
  float32_t y;
  uint64_t v7;

  v4 = self;
  v5.f32[0] = a3.x;
  y = a3.y;
  v5.f32[1] = y;
  v5.i32[2] = 0;
  v5.i32[3] = 1.0;
  v7 = SKCNode::nodeAtPoint((uint64_t)self->_skcNode, v5);
  if (v7)
    v4 = *(SKNode **)(v7 + 8);
  return v4;
}

- (SKNode)nodeAtPoint:(CGPoint)p
{
  SKNode *v3;
  float32x4_t v4;
  float32_t y;
  uint64_t v6;

  v3 = self;
  v4.f32[0] = p.x;
  y = p.y;
  v4.f32[1] = y;
  v4.i32[2] = 0;
  v4.i32[3] = 1.0;
  v6 = SKCNode::nodeAtPoint((uint64_t)self->_skcNode, v4);
  if (v6)
    v3 = *(SKNode **)(v6 + 8);
  return v3;
}

- (NSArray)nodesAtPoint:(CGPoint)p
{
  void *skcNode;
  float32x4_t v4;
  float32_t y;
  void *v6;
  uint64_t *i;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  v9 = (uint64_t)&v9;
  v10 = &v9;
  skcNode = self->_skcNode;
  v4.f32[0] = p.x;
  y = p.y;
  v4.f32[1] = y;
  v11 = 0;
  v4.i32[2] = 0;
  v4.i32[3] = 1.0;
  SKCNode::sortedNodesAtPoint((uint64_t)skcNode, &v9, v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = v10; i != &v9; i = (uint64_t *)i[1])
    objc_msgSend(v6, "addObject:", *(_QWORD *)(i[2] + 8));
  std::__list_imp<SKCRenderSortInfo *>::clear(&v9);
  return (NSArray *)v6;
}

- (CGPoint)convertPointFromParent:(CGPoint)a3
{
  float x;
  float y;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x2_t v8;
  float64x2_t v9;
  double v10;
  float v11;
  float v12;
  CGPoint result;

  x = a3.x;
  v11 = x;
  y = a3.y;
  v12 = y;
  *(double *)v5.i64 = (*(double (**)(void *, SEL))(*(_QWORD *)self->_skcNode + 112))(self->_skcNode, a2);
  v9 = vcvtq_f64_f32(vadd_f32(v8, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v5, v11), v6, v12), (float32x4_t)0, v7)));
  v10 = v9.f64[1];
  result.x = v9.f64[0];
  result.y = v10;
  return result;
}

- (CGPoint)convertPointToParent:(CGPoint)a3
{
  float x;
  float y;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x2_t v8;
  float64x2_t v9;
  double v10;
  float v11;
  float v12;
  CGPoint result;

  x = a3.x;
  v11 = x;
  y = a3.y;
  v12 = y;
  *(double *)v5.i64 = (*(double (**)(void *, SEL))(*(_QWORD *)self->_skcNode + 104))(self->_skcNode, a2);
  v9 = vcvtq_f64_f32(vadd_f32(v8, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v5, v11), v6, v12), (float32x4_t)0, v7)));
  v10 = v9.f64[1];
  result.x = v9.f64[0];
  result.y = v10;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromNode:(SKNode *)node
{
  double y;
  double x;
  SKNode *v7;
  SKNode *v8;
  SKCNode *skcNode;
  const SKCNode *v10;
  float32_t v11;
  float32x4_t v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = point.y;
  x = point.x;
  v7 = node;
  v8 = v7;
  if (v7 && v7 != self)
  {
    skcNode = (SKCNode *)self->_skcNode;
    v10 = -[SKNode _backingNode](v7, "_backingNode");
    v11 = y;
    v12.f32[0] = x;
    v12.f32[1] = v11;
    v12.i32[2] = 0;
    v12.i32[3] = 1.0;
    v13 = SKCNode::convertPointFromNode(skcNode, v10, v12);
    x = *(float *)&v13;
    y = *((float *)&v13 + 1);
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point toNode:(SKNode *)node
{
  double y;
  double x;
  SKNode *v7;
  SKNode *v8;
  SKCNode *skcNode;
  SKCNode *v10;
  float32_t v11;
  float32x4_t v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = point.y;
  x = point.x;
  v7 = node;
  v8 = v7;
  if (v7 && v7 != self)
  {
    skcNode = (SKCNode *)self->_skcNode;
    v10 = -[SKNode _backingNode](v7, "_backingNode");
    v11 = y;
    v12.f32[0] = x;
    v12.f32[1] = v11;
    v12.i32[2] = 0;
    v12.i32[3] = 1.0;
    v13 = SKCNode::convertPointToNode(skcNode, v10, v12);
    x = *(float *)&v13;
    y = *((float *)&v13 + 1);
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGSize)size
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(vmul_f32(*(float32x2_t *)((char *)self->_skcNode + 336), (float32x2_t)(SKCNode::getScale((__n128 *)self->_skcNode).n128_u64[0] & 0x7FFFFFFF7FFFFFFFLL)));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (BOOL)intersectsNode:(SKNode *)node
{
  return -[SKNode intersectsNode:useAlphaTest:](self, "intersectsNode:useAlphaTest:", node, 0);
}

- (BOOL)hasUniformAlphaAndIsVisible
{
  return 1;
}

- (void)dealloc
{
  void *skcNode;
  objc_super v4;

  skcNode = self->_skcNode;
  if (skcNode)
    (*(void (**)(void *, SEL))(*(_QWORD *)skcNode + 88))(skcNode, a2);
  -[NSMutableArray removeAllObjects](self->_children, "removeAllObjects");
  v4.receiver = self;
  v4.super_class = (Class)SKNode;
  -[SKNode dealloc](&v4, sel_dealloc);
}

- (double)globalBoundingVerts
{
  simd_float4 v1;
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4x4 v6;

  *(double *)v1.i64 = SKCNode::getWorldBoundingBox(*(SKCNode ***)(a1 + 24));
  v6.columns[0] = v1;
  v6.columns[1] = v2;
  v6.columns[2] = v3;
  v6.columns[3] = v4;
  return SKCBoundingBoxGetVerts(&v6);
}

- (double)globalAccumulatedBoundingVerts
{
  simd_float4 v1;
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4x4 v6;

  *(double *)v1.i64 = SKCNode::getWorldAccumulatedBoundingBox(*(char ***)(a1 + 24));
  v6.columns[0] = v1;
  v6.columns[1] = v2;
  v6.columns[2] = v3;
  v6.columns[3] = v4;
  return SKCBoundingBoxGetVerts(&v6);
}

- (NSDictionary)attributeValues
{
  NSMutableDictionary *attributeValues;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  attributeValues = self->_attributeValues;
  if (!attributeValues)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_attributeValues;
    self->_attributeValues = v4;

    attributeValues = self->_attributeValues;
  }
  return (NSDictionary *)(id)-[NSMutableDictionary copy](attributeValues, "copy");
}

- (void)setAttributeValues:(NSDictionary *)attributeValues
{
  NSDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  SKCNode *skcNode;
  NSDictionary *v10;

  v4 = attributeValues;
  v10 = v4;
  if (!self->_attributeValues)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_attributeValues;
    self->_attributeValues = v5;

    v4 = v10;
  }
  v7 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v4, "mutableCopy");
  v8 = self->_attributeValues;
  self->_attributeValues = v7;

  skcNode = (SKCNode *)self->_skcNode;
  *((_BYTE *)skcNode + 16) = 1;
  SKCNode::setFlags(skcNode, 2, 1);

}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  NSString *v4;
  NSMutableDictionary *attributeValues;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;

  v4 = key;
  attributeValues = self->_attributeValues;
  if (!attributeValues)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attributeValues;
    self->_attributeValues = v6;

    attributeValues = self->_attributeValues;
  }
  -[NSMutableDictionary objectForKey:](attributeValues, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAttributeValue *)v8;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  NSString *v6;
  SKAttributeValue *v7;
  NSString *v8;
  NSMutableDictionary *attributeValues;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  SKCNode *skcNode;
  SKAttributeValue *v13;

  v13 = value;
  v6 = key;
  v7 = v13;
  v8 = v6;
  attributeValues = self->_attributeValues;
  if (!attributeValues)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v13);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_attributeValues;
    self->_attributeValues = v10;

    attributeValues = self->_attributeValues;
    v7 = v13;
  }
  -[NSMutableDictionary setObject:forKey:](attributeValues, "setObject:forKey:", v7, v8);
  skcNode = (SKCNode *)self->_skcNode;
  *((_BYTE *)skcNode + 16) = 1;
  SKCNode::setFlags(skcNode, 64, 1);

}

- (void)setNeedsFocusUpdate
{
  id v3;

  -[objc_class focusSystemForEnvironment:](NSClassFromString(CFSTR("UIFocusSystem")), "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  -[objc_class focusSystemForEnvironment:](NSClassFromString(CFSTR("UIFocusSystem")), "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)canBecomeFocused
{
  return self->_focusBehavior == 2;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isEffectivelyHidden
{
  void *v3;
  BOOL v4;
  double v5;

  -[SKNode parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isEffectivelyHidden") & 1) != 0 || -[SKNode isHidden](self, "isHidden"))
  {
    v4 = 1;
  }
  else
  {
    -[SKNode alpha](self, "alpha");
    v4 = v5 <= 0.00000011920929;
  }

  return v4;
}

- (BOOL)_isEligibleForFocus
{
  int v3;
  BOOL v4;
  char v5;
  BOOL result;

  if (-[SKNode isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    v3 = !-[SKNode _isEffectivelyHidden](self, "_isEffectivelyHidden");
  else
    v3 = 0;
  if (-[SKNode canBecomeFocused](self, "canBecomeFocused"))
    v4 = self->_focusBehavior == 0;
  else
    v4 = 0;
  v5 = SKGetLinkedOnOrAfter() ^ 1 | v4;
  result = v5 & v3;
  if ((v5 & 1) == 0 && ((v3 ^ 1) & 1) == 0)
    return self->_focusBehavior != 0;
  return result;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (CGPoint)convertPoint:(CGPoint)cgpoint toCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  SKScene *v10;
  uint64_t v11;
  SKView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint v17;
  CGPoint result;

  y = cgpoint.y;
  x = cgpoint.x;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SKNode convertPoint:toNode:](self, "convertPoint:toNode:", v7, x, y);
      x = v8;
      y = v9;
    }
    else
    {
      -[SKNode scene](self, "scene");
      v10 = (SKScene *)objc_claimAutoreleasedReturnValue();
      -[SKScene view](v10, "view");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (SKView *)v11;
      if (v10 && v11)
      {
        -[SKNode convertPoint:toNode:](self, "convertPoint:toNode:", v10, x, y);
        -[SKView convertPoint:toCoordinateSpace:](v12, "convertPoint:toCoordinateSpace:", v7, CGPointConvertFromSceneToView(v10, v12, v17).n128_f64[0]);
        x = v13;
        y = v14;
      }

    }
  }

  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)cgpoint fromCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  SKScene *v10;
  SKView *v11;
  SKView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint v17;
  CGPoint result;

  y = cgpoint.y;
  x = cgpoint.x;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v7, x, y);
      x = v8;
      y = v9;
    }
    else
    {
      -[SKNode scene](self, "scene");
      v10 = (SKScene *)objc_claimAutoreleasedReturnValue();
      -[SKScene view](v10, "view");
      v11 = (SKView *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 && v11)
      {
        -[SKView convertPoint:fromCoordinateSpace:](v11, "convertPoint:fromCoordinateSpace:", v7, x, y);
        -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v10, CGPointConvertFromViewToScene(v12, v10, v17).n128_f64[0]);
        x = v13;
        y = v14;
      }

    }
  }

  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  -[SKNode convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v9, MinX, CGRectGetMinY(v26));
  v12 = v11;
  v14 = v13;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  -[SKNode convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v9, MaxX, CGRectGetMaxY(v28));
  v17 = v16;
  v19 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v14;
  else
    v20 = v19;

  v21 = v12;
  v22 = v20;
  v23 = vabdd_f64(v12, v17);
  v24 = vabdd_f64(v14, v19);
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  -[SKNode convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v9, MinX, CGRectGetMinY(v26));
  v12 = v11;
  v14 = v13;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  -[SKNode convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v9, MaxX, CGRectGetMaxY(v28));
  v17 = v16;
  v19 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v14;
  else
    v20 = v19;

  v21 = v12;
  v22 = v20;
  v23 = vabdd_f64(v12, v17);
  v24 = vabdd_f64(v14, v19);
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (id)debugHierarchyChildGroupingID
{
  return CFSTR("com.apple.SpriteKit.SKNode");
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpriteKit.SKNode")))
  {
    objc_msgSend(v7, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  __CFDictionary *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  CFNumberRef v22;
  void *v23;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  uint64_t valuePtr;
  _QWORD v35[20];

  v35[18] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("alpha"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf"));
  v33 = Mutable;
  v35[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("constraints"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v32 = v5;
  v35[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("frame"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v31 = v6;
  v35[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("hidden"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v30 = v7;
  v35[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("name"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  if (*MEMORY[0x1E0CA5C20])
    CFDictionaryAddValue(v8, CFSTR("propertyFormat"), (const void *)*MEMORY[0x1E0CA5C20]);
  v29 = v8;
  v35[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("paused"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("b"));
  v28 = v9;
  v35[5] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("physicsBody"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v27 = v10;
  v35[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("position"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v26 = v11;
  v35[7] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("reachConstraints"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v25 = v12;
  v35[8] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("speed"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("CGf"));
  v35[9] = v13;
  v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("userData"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v35[10] = v14;
  v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("userInteractionEnabled"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("b"));
  v35[11] = v15;
  v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("xScale"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("CGf"));
  v35[12] = v16;
  v17 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("yScale"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("CGf"));
  v35[13] = v17;
  v18 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("zPosition"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("CGf"));
  v35[14] = v18;
  v19 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("zRotation"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("CGf"));
  v35[15] = v19;
  v20 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("anchorPoint"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v35[16] = v20;
  v21 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("untransformedSize"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  valuePtr = 8;
  v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v21, CFSTR("visibility"), v22);
  CFRelease(v22);
  v35[17] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  const void **v12;
  uint64_t v13;
  char v14;
  char v15;
  CFNumberRef v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  char v20;
  char v21;
  CFNumberRef v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  id v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  id v39;
  _QWORD v40[3];
  __CFString *v41;
  __CFString *v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("anchorPoint")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("untransformedSize")))
    {
      objc_msgSend(v9, "_untransformedSize");
      v41 = v17;
      v42 = v18;
      v12 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
      v19 = 0;
      v20 = 1;
      do
      {
        v21 = v20;
        v22 = CFNumberCreate(0, kCFNumberCGFloatType, &v41 + v19);
        v20 = 0;
        v12[v19] = v22;
        v19 = 1;
      }
      while ((v21 & 1) != 0);
      goto LABEL_8;
    }
    v39 = v9;
    v23 = (NSString *)v8;
    if (-[NSString length](v23, "length"))
    {
      NSSelectorFromString(v23);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v24 = v23;
        if (v24)
        {
LABEL_12:
          objc_msgSend(v39, "valueForKey:", v24);
          a6 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_29:

          goto LABEL_30;
        }
      }
      else
      {
        if (-[NSString length](v23, "length") < 2)
        {
          -[NSString uppercaseString](v23, "uppercaseString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSString substringToIndex:](v23, "substringToIndex:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "uppercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString substringFromIndex:](v23, "substringFromIndex:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingString:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(CFSTR("is"), "stringByAppendingString:", v28);
        v29 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSSelectorFromString(v29);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v24 = v29;
        else
          v24 = 0;

        if (v24)
          goto LABEL_12;
      }
    }
    if (a6)
    {
      v30 = v39;
      v31 = v23;
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v30);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = &stru_1EA5021F8;
      }
      if (v31)
        v33 = v31;
      else
        v33 = &stru_1EA5021F8;
      v34 = v33;
      v40[0] = CFSTR("propertyName");
      v40[1] = CFSTR("objectDescription");
      v41 = v34;
      v42 = v32;
      v40[2] = CFSTR("errorDescription");
      v43 = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, v40, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_retainAutorelease(v36);
      *a6 = v37;

      v24 = 0;
      a6 = 0;
    }
    else
    {
      v24 = 0;
    }
    goto LABEL_29;
  }
  objc_msgSend(v9, "_anchorPoint");
  v41 = v10;
  v42 = v11;
  v12 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  v13 = 0;
  v14 = 1;
  do
  {
    v15 = v14;
    v16 = CFNumberCreate(0, kCFNumberCGFloatType, &v41 + v13);
    v14 = 0;
    v12[v13] = v16;
    v13 = 1;
  }
  while ((v15 & 1) != 0);
LABEL_8:
  a6 = (id *)CFArrayCreate(0, v12, 2, MEMORY[0x1E0C9B378]);
  CFRelease(*v12);
  CFRelease(v12[1]);
  free(v12);
LABEL_30:

  return a6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 88);
}

- (SKReachConstraints)reachConstraints
{
  return self->_reachConstraints;
}

- (void)setReachConstraints:(SKReachConstraints *)reachConstraints
{
  objc_setProperty_nonatomic_copy(self, a2, reachConstraints, 120);
}

- (SKNodeFocusBehavior)focusBehavior
{
  return self->_focusBehavior;
}

- (void)setFocusBehavior:(SKNodeFocusBehavior)focusBehavior
{
  self->_focusBehavior = focusBehavior;
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(NSMutableDictionary *)userData
{
  objc_storeStrong((id *)&self->_userData, userData);
}

- (GKEntity)entity
{
  return (GKEntity *)objc_loadWeakRetained((id *)&self->_entity);
}

- (void)setEntity:(GKEntity *)entity
{
  objc_storeWeak((id *)&self->_entity, entity);
}

- (BOOL)performFullCapture
{
  return self->_performFullCapture;
}

- (void)setPerformFullCapture:(BOOL)a3
{
  self->_performFullCapture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entity);
  objc_storeStrong((id *)&self->_reachConstraints, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributeValues, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_keyedSubSprites, 0);
  objc_storeStrong((id *)&self->_keyedActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

+ (id)nodeFromCaptureData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v12);
  v5 = v12;
  objc_msgSend(v4, "setRequiresSecureCoding:", 0);
  +[SKCaptureUnarchiverDelegate sharedInstance](SKCaptureUnarchiverDelegate, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v13[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishDecoding");
  objc_msgSend(v9, "objectForKey:", CFSTR("node"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createFullCaptureData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("node");
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKFrameCaptureDelegate sharedInstance](SKFrameCaptureDelegate, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "setDelegate:", v3);
  objc_msgSend(v4, "encodeObject:forKey:", v2, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v4, "finishEncoding");
  objc_msgSend(v4, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)archiveToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v17;

  v4 = a3;
  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("sks"));
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v10;
  }
  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v13 || (objc_msgSend(v12, "writeToFile:atomically:", v11, 1) & 1) == 0)
    v14 = CFSTR("Failed to archive %@ to %@");
  else
    v14 = CFSTR("Archived %@ to %@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v14, self, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v15);

  return v15;
}

- (void)debugPrint
{
  -[SKNode _debugPrint:mask:](self, "_debugPrint:mask:", 0, 0);
}

- (void)_debugPrint:(int)a3
{
  __CFString *v5;
  int v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 < 1)
  {
    v7 = &stru_1EA5021F8;
  }
  else
  {
    v5 = &stru_1EA5021F8;
    v6 = a3;
    do
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("\t"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
      --v6;
    }
    while (v6);
  }
  NSLog(CFSTR("%@ [%p] %@"), v7, self, self);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SKNode children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    v11 = (a3 + 1);
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_debugPrint:", v11);
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_debugPrint:(int)a3 mask:(unint64_t)a4
{
  int v7;
  __CFString *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;

  if (a3 < 1)
  {
    v13 = &stru_1EA5021F8;
  }
  else
  {
    v7 = 0;
    v8 = &stru_1EA5021F8;
    v9 = -a3;
    do
    {
      if (v7)
      {
        -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(" "));
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (__CFString *)v10;
      }
      if (((1 << v7) & a4) != 0)
        v11 = CFSTR("|");
      else
        v11 = CFSTR(" ");
      if (v9 + v7 == -1)
        v12 = CFSTR("|");
      else
        v12 = v11;
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v12);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v7;
      v13 = v24;
      v8 = v24;
    }
    while (v9 + v7);
  }
  v25 = (__CFString *)v13;
  NSLog(CFSTR("%@-[%p] %@"), v13, self, self);
  -[SKNode children](self, "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  v16 = v15;
  if (v15)
  {
    v17 = 0;
    v18 = 1 << a3;
    v19 = (a3 + 1);
    v20 = v15 - 1;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 == v17)
        v23 = 0;
      else
        v23 = v18;
      objc_msgSend(v21, "_debugPrint:mask:", v19, v23 | a4);

      ++v17;
    }
    while (v16 != v17);
  }

}

- (void)_getWorldTransform:(float *)a3 positionY:(float *)a4 rotation:(float *)a5 xScale:(float *)a6 yScale:(float *)a7
{
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  SKCNode::resolveWorldPositionRotationAndScale((_OWORD *)self->_skcNode, &v14, &v13, &v12);
  if (a3)
    *(_DWORD *)a3 = v14;
  if (a4)
    *a4 = *((float *)&v14 + 1);
  if (a5)
    *a5 = *((float *)&v13 + 2);
  if (a6)
    *(_DWORD *)a6 = v12;
  if (a7)
    *a7 = *((float *)&v12 + 1);
}

- (void)_getBasePhysicsScale:(float *)a3 yScale:(float *)a4
{
  unint64_t v6;

  v6 = SKCNode::getBasePhysicsScale((__n128 *)self->_skcNode).n128_u64[0];
  if (a3)
    *(_DWORD *)a3 = v6;
  if (a4)
    *a4 = *((float *)&v6 + 1);
}

- (void)updatePhysicsPositionAndScaleFromSprite
{
  (*(void (**)(void *))(*(_QWORD *)self->_skcNode + 200))(self->_skcNode);
}

- (id)childrenInRect:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double x;
  double y;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = self->_children;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = x + width;
    v10 = y + height;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v13, "convertPointFromParent:", x, y, *(_QWORD *)&x, *(_QWORD *)&y, (_QWORD)v34);
        v15 = v14;
        v17 = v16;
        objc_msgSend(v13, "convertPointFromParent:", v9, v10);
        v19 = v18;
        v21 = v20;
        objc_msgSend(v13, "_anchorPoint");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v13, "_size");
        v40.size.width = v26;
        v40.size.height = v27;
        v28 = v19 - v15;
        v29 = v21 - v17;
        v40.origin.x = -(v26 * v23);
        v40.origin.y = -(v27 * v25);
        v41.origin.x = v15;
        v41.origin.y = v17;
        v41.size.width = v28;
        v41.size.height = v29;
        if (CGRectIntersectsRect(v40, v41))
          objc_msgSend(v6, "addObject:", v13);
        objc_msgSend(v13, "childrenInRect:", v15, v17, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v30);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }

  return v6;
}

- (NSMutableDictionary)_info
{
  return self->_info;
}

- (void)set_info:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (BOOL)_showBounds
{
  return 0;
}

- (CGRect)_untransformedBounds
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  float32x4_t AABB;
  float32x4_t v7;
  float32x4_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  simd_float4x4 v13;
  CGRect result;

  *(double *)v2.i64 = SKCNode::getUntransformedBoundingBox((SKCNode *)self->_skcNode);
  v13.columns[0] = v2;
  v13.columns[1] = v3;
  v13.columns[2] = v4;
  v13.columns[3] = v5;
  AABB = SKCBoundingBoxGetAABB(&v13);
  v7 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  v8 = vdivq_f32(vrndxq_f32(vmulq_f32(AABB, v7)), v7);
  v9 = v8.f32[0];
  v10 = v8.f32[1];
  v11 = v8.f32[2];
  v12 = v8.f32[3];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGSize)_untransformedSize
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  float32x4_t AABB;
  float32x4_t v7;
  int8x16_t v8;
  float64x2_t v9;
  double v10;
  simd_float4x4 v11;
  CGSize result;

  *(double *)v2.i64 = SKCNode::getUntransformedBoundingBox((SKCNode *)self->_skcNode);
  v11.columns[0] = v2;
  v11.columns[1] = v3;
  v11.columns[2] = v4;
  v11.columns[3] = v5;
  AABB = SKCBoundingBoxGetAABB(&v11);
  v7 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  v8 = (int8x16_t)vrndxq_f32(vmulq_f32(AABB, v7));
  v9 = vcvtq_f64_f32(vdiv_f32((float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), *(float32x2_t *)v7.f32));
  v10 = v9.f64[1];
  result.width = v9.f64[0];
  result.height = v10;
  return result;
}

- (CGPoint)_anchorPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcNode + 352));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)set_anchorPoint:(CGPoint)a3
{
  SKCNode *skcNode;
  unsigned int v4;
  unsigned int v5;
  __int128 v6;

  skcNode = (SKCNode *)self->_skcNode;
  *(float *)&v4 = a3.x;
  *(float *)&v5 = a3.y;
  v6 = __PAIR64__(v5, v4);
  SKCNode::setAnchor(skcNode, &v6);
}

- (CGSize)_size
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcNode + 336));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (BOOL)intersectsNode:(id)a3 useAlphaTest:(BOOL)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (v5)
    v6 = SKCNode::intersectsNode((SKCNode **)-[SKNode _backingNode](self, "_backingNode"), (SKCNode **)objc_msgSend(v5, "_backingNode"));
  else
    v6 = 0;

  return v6;
}

- (id)allIntersectionsWithNode:(id)a3 useAlphaTest:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v18;
  id v19;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[SKNode children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObject:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v18;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v23 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = v24;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = 0;
          v14 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              if (objc_msgSend(v10, "intersectsNode:useAlphaTest:", v16, v4))
              {
                if (!v13)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v13, "addObject:", v16);
              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v12);

          v8 = v22;
          if (v13)
            objc_msgSend(v20, "setObject:forKey:", v13, v10);
        }
        else
        {

          v13 = 0;
        }

        ++v9;
      }
      while (v9 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  return v20;
}

- (id)_subnodeFromIndexPath:(id)a3
{
  id v4;
  SKNode *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SKNode *v9;

  v4 = a3;
  v5 = self;
  if (v4 && (v6 = objc_msgSend(v4, "length"), v6 >= 1))
  {
    v7 = 0;
    do
    {
      -[SKNode children](v5, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "indexAtPosition:", v7));
      v9 = (SKNode *)objc_claimAutoreleasedReturnValue();
      ++v7;

      v5 = v9;
    }
    while (v6 != v7);
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (BOOL)_pathFromPhysicsBodyToPoints:(SKNode *)self outSize:(SEL)a2
{
  void **v2;
  int64_t *v3;
  BOOL result;
  int64_t *v6;
  void **v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;

  result = 0;
  if (v2)
  {
    v6 = v3;
    if (v3)
    {
      v7 = v2;
      -[SKNode physicsBody](self, "physicsBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "volume");

      if (v9)
      {
        v10 = *(_QWORD *)(v9 + 16) - *(_QWORD *)(v9 + 8);
        *v6 = v10 >> 3;
        *v7 = malloc_type_malloc(v10, 0x100004000313F17uLL);
        v11 = *(_QWORD *)(v9 + 8);
        if (*(_QWORD *)(v9 + 16) != v11)
        {
          v12 = 0;
          do
          {
            *((_QWORD *)*v7 + v12) = *(_QWORD *)(v11 + 8 * v12);
            ++v12;
            v11 = *(_QWORD *)(v9 + 8);
          }
          while (v12 < (*(_QWORD *)(v9 + 16) - v11) >> 3);
        }
        PKPath::~PKPath((PKPath *)v9);
        MEMORY[0x1DF0CF560]();
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (NSArray)_allActions
{
  NSMutableArray *actions;
  void *v3;
  void *v4;

  actions = self->_actions;
  -[NSMutableDictionary allValues](self->_keyedActions, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray arrayByAddingObjectsFromArray:](actions, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_copyImageData
{
  void *v3;
  SKView *v4;
  SKView *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1DF0CFADC](self, a2);
  v4 = -[SKView initWithFrame:]([SKView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  v5 = v4;
  if (v4)
  {
    -[SKView textureFromNode:](v4, "textureFromNode:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "_copyImageData");

  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (CGRect)_convertFrameToView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = CGRectConvertFrameFromNodeToView(self, (SKView *)a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)createDebugHierarchyVisualRepresentation
{
  SKNode *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SKNode *v8;
  __CFData *Mutable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  SKNodeVisualRepresentationUnarchiver *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  double v27;
  double v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGImage *v35;
  CGImageDestination *v36;
  const __CFAllocator *v37;
  CFNumberRef v38;
  void *v39;
  const __CFDictionary *v40;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  int valuePtr;
  _QWORD v48[2];
  _QWORD v49[2];
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v2 = self;
  -[SKNode scene](v2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (-[SKNode scene](v2, "scene"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v3,
        !v5))
  {
    v8 = v2;
LABEL_7:
    Mutable = 0;
    goto LABEL_49;
  }
  -[SKNode scene](v2, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = -[NSKeyedArchiver initRequiringSecureCoding:]([SKNodeVisualRepresentationArchiver alloc], "initRequiringSecureCoding:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_opt_class();
    if (v7 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_opt_class();
    if (v11 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_opt_class();
    if (v12 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_opt_class();
    if (v13 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_opt_class();
    if (v14 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_opt_class();
    if (v15 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_opt_class();
    if (v16 == objc_opt_class())
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_opt_class();
    if (v17 != objc_opt_class())
    {
LABEL_31:
      v18 = (void *)MEMORY[0x1E0CB36F8];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setClassName:forClass:", v20, objc_opt_class());

    }
  }
LABEL_32:
  objc_msgSend(v45, "encodeObject:forKey:", v2, CFSTR("node"));
  objc_msgSend(v45, "finishEncoding");
  v21 = [SKNodeVisualRepresentationUnarchiver alloc];
  objc_msgSend(v45, "encodedData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v23 = (void *)-[SKNodeVisualRepresentationUnarchiver initForReadingFromData:error:](v21, "initForReadingFromData:error:", v22, &v46);
  v42 = v46;

  objc_msgSend(v23, "setRequiresSecureCoding:", 0);
  objc_msgSend(v23, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("node"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "finishDecoding");
  objc_msgSend(v24, "removeAllChildren");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v24, "setPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v42);
    objc_msgSend(v24, "setXScale:", 1.0);
    objc_msgSend(v24, "setYScale:", 1.0);
    objc_msgSend(v24, "setZRotation:", 0.0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKNode tileSet](v2, "tileSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTileSet:", v25);

  }
  v8 = v24;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v44, "frame");
  v29 = isKindOfClass ^ 1;
  if (v27 < 1024.0 || v28 < 1024.0)
  {
    if (v27 >= v28)
      v30 = v28;
    else
      v30 = v27;
  }
  else
  {
    v30 = 1024;
  }
  v48[0] = CFSTR("doNotRenderChildNodes");
  Mutable = (__CFData *)0x1E0CB3000;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29 & 1, v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = CFSTR("textureMaxRenderSize");
  v49[0] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "textureFromNode:withOptions:", v8, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = (CGImage *)objc_msgSend(v34, "CGImage");
    if (v35)
    {
      valuePtr = 1065353216;
      Mutable = CFDataCreateMutable(0, 0);
      v36 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
      v37 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v38 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
      v39 = (void *)*MEMORY[0x1E0CBC780];
      values = v38;
      keys[0] = v39;
      v40 = CFDictionaryCreate(v37, (const void **)keys, (const void **)&values, 1, 0, 0);
      CGImageDestinationAddImage(v36, v35, v40);
      CGImageDestinationFinalize(v36);
      CFRelease(v40);
      CFRelease(v38);
      CFRelease(v36);
    }
    else
    {
      Mutable = 0;
    }
    CGImageRelease(v35);
  }

  if (!v34)
    goto LABEL_7;
LABEL_49:

  return Mutable;
}

- (void)setParent:(id)a3
{
  id v4;
  void *skcNode;
  SKNode *obj;

  obj = (SKNode *)a3;
  if (-[SKNode inParentHierarchy:](obj, "inParentHierarchy:", self))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Setting this node as parent would create a loop: %@"), self);
  if (obj == self)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A Node can't parent itself: %@"), obj);
  v4 = objc_storeWeak((id *)&self->_parent, obj);

  if (obj)
    skcNode = obj->_skcNode;
  else
    skcNode = 0;
  *((_QWORD *)self->_skcNode + 10) = skcNode;

}

@end
