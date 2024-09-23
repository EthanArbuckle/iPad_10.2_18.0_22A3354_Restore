@implementation GVInternalRenderer

+ (void)drawAllNodes:(id)a3 renderer:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_msgSend(a3, "nodes", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
          objc_msgSend(a4, "drawNode:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

+ (void)drawAllEdges:(id)a3 renderer:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t m;
  void *v18;
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
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  id obj;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  double v97;
  double v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = (id)objc_msgSend(a3, "edges");
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v75)
  {
    v73 = a4;
    v74 = *(_QWORD *)v94;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v94 != v74)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(v8, "from");
        v10 = objc_msgSend(v8, "to");
        objc_msgSend(v6, "removeAllObjects");
        objc_msgSend(v9, "center");
        v97 = v11;
        v98 = v12;
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
        v76 = (void *)v10;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          switch(objc_msgSend(a4, "direction"))
          {
            case 0u:
              break;
            case 1u:
              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v29 = (void *)objc_msgSend(v8, "dummies");
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v86;
                do
                {
                  for (i = 0; i != v31; ++i)
                  {
                    if (*(_QWORD *)v86 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                    objc_msgSend(v34, "cx");
                    v36 = v35;
                    objc_msgSend(v34, "y");
                    v97 = v36;
                    v98 = v37;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                    objc_msgSend(v34, "cx");
                    v39 = v38;
                    objc_msgSend(v34, "y");
                    v41 = v40;
                    objc_msgSend(v34, "h");
                    v97 = v39;
                    v98 = v41 + v42;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
                }
                while (v31);
              }
              goto LABEL_15;
            case 2u:
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
              v43 = (void *)objc_msgSend(v8, "dummies");
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v82;
                do
                {
                  for (j = 0; j != v45; ++j)
                  {
                    if (*(_QWORD *)v82 != v46)
                      objc_enumerationMutation(v43);
                    v48 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                    objc_msgSend(v48, "x");
                    v50 = v49;
                    objc_msgSend(v48, "cy");
                    v97 = v50;
                    v98 = v51;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                    objc_msgSend(v48, "x");
                    v53 = v52;
                    objc_msgSend(v48, "w");
                    v55 = v53 + v54;
                    objc_msgSend(v48, "cy");
                    v97 = v55;
                    v98 = v56;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
                }
                while (v45);
              }
              goto LABEL_15;
            case 3u:
              v79 = 0u;
              v80 = 0u;
              v77 = 0u;
              v78 = 0u;
              v57 = (void *)objc_msgSend(v8, "dummies");
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
              if (v58)
              {
                v59 = v58;
                v60 = *(_QWORD *)v78;
                do
                {
                  for (k = 0; k != v59; ++k)
                  {
                    if (*(_QWORD *)v78 != v60)
                      objc_enumerationMutation(v57);
                    v62 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
                    objc_msgSend(v62, "x");
                    v64 = v63;
                    objc_msgSend(v62, "w");
                    v66 = v64 + v65;
                    objc_msgSend(v62, "cy");
                    v97 = v66;
                    v98 = v67;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                    objc_msgSend(v62, "x");
                    v69 = v68;
                    objc_msgSend(v62, "cy");
                    v97 = v69;
                    v98 = v70;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                  }
                  v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
                }
                while (v59);
              }
              goto LABEL_15;
            default:
              +[GVInternalRenderer drawAllEdges:renderer:].cold.1();
          }
        }
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v13 = (void *)objc_msgSend(v8, "dummies");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v90;
          do
          {
            for (m = 0; m != v15; ++m)
            {
              if (*(_QWORD *)v90 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * m);
              objc_msgSend(v18, "cx");
              v20 = v19;
              objc_msgSend(v18, "y");
              v22 = v21;
              objc_msgSend(v18, "h");
              v97 = v20;
              v98 = v22 + v23;
              objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
              objc_msgSend(v18, "cx");
              v25 = v24;
              objc_msgSend(v18, "y");
              v97 = v25;
              v98 = v26;
              objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
          }
          while (v15);
        }
LABEL_15:
        objc_msgSend(v76, "center");
        v97 = v27;
        v98 = v28;
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
        a4 = v73;
        objc_msgSend(v73, "drawEdge:withPath:", v8, v6);
        ++v7;
      }
      while (v7 != v75);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      v75 = v71;
    }
    while (v71);
  }
}

+ (void)render:(id)a3 renderer:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a4, "drawEdgesFirst"))
  {
    +[GVInternalRenderer drawAllEdges:renderer:](GVInternalRenderer, "drawAllEdges:renderer:", a3, a4);
    +[GVInternalRenderer drawAllNodes:renderer:](GVInternalRenderer, "drawAllNodes:renderer:", a3, a4);
  }
  else
  {
    +[GVInternalRenderer drawAllNodes:renderer:](GVInternalRenderer, "drawAllNodes:renderer:", a3, a4);
    +[GVInternalRenderer drawAllEdges:renderer:](GVInternalRenderer, "drawAllEdges:renderer:", a3, a4);
  }
}

+ (void)drawAllEdges:renderer:.cold.1()
{
  __assert_rtn("+[GVInternalRenderer drawAllEdges:renderer:]", "GVRenderer.m", 96, "0 && \"unreachable\");
}

@end
