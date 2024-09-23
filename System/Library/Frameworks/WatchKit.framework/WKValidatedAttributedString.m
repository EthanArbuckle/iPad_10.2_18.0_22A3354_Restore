@implementation WKValidatedAttributedString

void ___WKValidatedAttributedString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    v11 = *MEMORY[0x24BDF65C0];
    v48 = *MEMORY[0x24BDF6618];
    v45 = *MEMORY[0x24BDF65C8];
    v46 = *MEMORY[0x24BDF6600];
    v44 = *MEMORY[0x24BDF6698];
    v43 = *MEMORY[0x24BDF66D0];
    v42 = *MEMORY[0x24BDF6650];
    v41 = *MEMORY[0x24BDF65F8];
    v47 = a4;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v12);
        if (objc_msgSend(v13, "isEqualToString:", v11))
        {
          wk_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_11;
          objc_msgSend(*(id *)(a1 + 32), "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446723;
          v54 = "_WKValidatedAttributedString_block_invoke";
          v55 = 1024;
          v56 = 315;
          v57 = 2113;
          v58 = v15;
          v16 = v14;
          v17 = "%{public}s:%d: Attributed string '%{private}@' contains NSAttachmentAttributeName. Removed";
LABEL_40:
          _os_log_error_impl(&dword_215918000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x1Cu);

          a4 = v47;
          goto LABEL_11;
        }
        if (objc_msgSend(v13, "isEqualToString:", v48))
        {
          wk_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_11;
          objc_msgSend(*(id *)(a1 + 32), "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446723;
          v54 = "_WKValidatedAttributedString_block_invoke";
          v55 = 1024;
          v56 = 318;
          v57 = 2113;
          v58 = v15;
          v16 = v14;
          v17 = "%{public}s:%d: Attributed string '%{private}@' contains NSLinkAttributeName. Removed";
          goto LABEL_40;
        }
        if (objc_msgSend(v13, "isEqualToString:", v46))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          a4 = v47;
          if ((isKindOfClass & 1) == 0)
          {
            wk_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 32), "string");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v13);
              v34 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446979;
              v54 = "_WKValidatedAttributedString_block_invoke";
              v55 = 1024;
              v56 = 321;
              v57 = 2113;
              v58 = v40;
              v59 = 2114;
              v60 = v34;
              v31 = (void *)v34;
              v32 = v14;
              v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSForegroundColorAttributeName that isn't a "
                    "UIColor (%{public}@). Removed";
              goto LABEL_38;
            }
LABEL_11:

            objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v13, a3, a4);
            goto LABEL_12;
          }
        }
        if (objc_msgSend(v13, "isEqualToString:", v45))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v21 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v21 & 1) == 0)
          {
            wk_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_11;
            objc_msgSend(*(id *)(a1 + 32), "string");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v35 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            v55 = 1024;
            v56 = 324;
            v57 = 2113;
            v58 = v40;
            v59 = 2114;
            v60 = v35;
            v31 = (void *)v35;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSBackgroundColorAttributeName that isn't a UI"
                  "Color (%{public}@). Removed";
LABEL_38:
            _os_log_error_impl(&dword_215918000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x26u);

            a4 = v47;
            goto LABEL_11;
          }
        }
        if (objc_msgSend(v13, "isEqualToString:", v44))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v23 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v23 & 1) == 0)
          {
            wk_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_11;
            objc_msgSend(*(id *)(a1 + 32), "string");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v36 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            v55 = 1024;
            v56 = 327;
            v57 = 2113;
            v58 = v40;
            v59 = 2114;
            v60 = v36;
            v31 = (void *)v36;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSStrokeColorAttributeName that isn't a UIColo"
                  "r (%{public}@). Removed";
            goto LABEL_38;
          }
        }
        if (objc_msgSend(v13, "isEqualToString:", v43))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v25 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v25 & 1) == 0)
          {
            wk_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_11;
            objc_msgSend(*(id *)(a1 + 32), "string");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v37 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            v55 = 1024;
            v56 = 330;
            v57 = 2113;
            v58 = v40;
            v59 = 2114;
            v60 = v37;
            v31 = (void *)v37;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSUnderlineColorAttributeName that isn't a UIC"
                  "olor (%{public}@). Removed";
            goto LABEL_38;
          }
        }
        if (objc_msgSend(v13, "isEqualToString:", v42))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v27 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v27 & 1) == 0)
          {
            wk_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_11;
            objc_msgSend(*(id *)(a1 + 32), "string");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v38 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            v55 = 1024;
            v56 = 333;
            v57 = 2113;
            v58 = v40;
            v59 = 2114;
            v60 = v38;
            v31 = (void *)v38;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSStrikethroughColorAttributeName that isn't a"
                  " UIColor (%{public}@). Removed";
            goto LABEL_38;
          }
        }
        if (objc_msgSend(v13, "isEqualToString:", v41))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v29 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v29 & 1) == 0)
          {
            wk_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 32), "string");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v13);
              v30 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446979;
              v54 = "_WKValidatedAttributedString_block_invoke";
              v55 = 1024;
              v56 = 336;
              v57 = 2113;
              v58 = v40;
              v59 = 2114;
              v60 = v30;
              v31 = (void *)v30;
              v32 = v14;
              v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSFontAttributeName that isn't a UIFont (%{p"
                    "ublic}@). Removed";
              goto LABEL_38;
            }
            goto LABEL_11;
          }
        }
LABEL_12:
        ++v12;
      }
      while (v9 != v12);
      v39 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      v9 = v39;
    }
    while (v39);
  }

}

@end
