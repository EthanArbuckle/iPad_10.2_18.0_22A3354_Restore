@implementation DYInOrderInstructionFilesVisitor

- (BOOL)_openFilenames:(id)a3 store:(id)a4 filesArray:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(a3);
      v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
      v15 = 0;
      v13 = objc_msgSend(a4, "openFileWithFilename:error:", v12, &v15);
      if (!v13)
        break;
      objc_msgSend(a5, "addObject:", v13);
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)_openFiles:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD *v12;
  NSArray *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  NSArray *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *context;
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x2426225CC](self, a2);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x24BE393E8], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  v6 = *MEMORY[0x24BE393E0];
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x24BE393E0], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  v7 = *MEMORY[0x24BE393F0];
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x24BE393F0], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  v8 = *MEMORY[0x24BE393C0];
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x24BE393C0], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  if (-[DYCaptureVisitor visitUnusedResoures](self, "visitUnusedResoures"))
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x24BE39400], v8, context), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  v9 = (NSArray *)objc_opt_new();
  v10 = -[DYInOrderInstructionFilesVisitor _openFilenames:store:filesArray:](self, "_openFilenames:store:filesArray:", v5, a3, v9);
  self->_initialPhaseFiles = v9;

  if (!v10)
    goto LABEL_13;
  if (self->_unsorted)
  {
    v11 = (void *)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x24BE393F8], 0);
    if (objc_msgSend(v11, "count"))
      goto LABEL_9;
    v12 = (_QWORD *)MEMORY[0x24BE393D0];
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x24BE393B0];
  }
  v11 = (void *)objc_msgSend(a3, "filenamesWithPrefix:error:", *v12, 0);
LABEL_9:
  if (objc_msgSend(v11, "count") != 1)
  {
    objc_msgSend(v11, "count");
    DYLog();
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0B88];
    v28 = *MEMORY[0x24BDD0FC8];
    v21 = v28;
    v29[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Capture file names: %@"), v11);
    v22 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 256, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
    v23 = *MEMORY[0x24BDD1398];
    v26[0] = v21;
    v26[1] = v23;
    v27[0] = CFSTR("The gputrace is invalid because it contains multiple capture archives.");
    v27[1] = v22;
    -[DYCaptureVisitor setVisitCaptureArchiveError:](self, "setVisitCaptureArchiveError:", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v20, 256, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2)));
    goto LABEL_13;
  }
  v13 = (NSArray *)objc_opt_new();
  v14 = -[DYInOrderInstructionFilesVisitor _openFilenames:store:filesArray:](self, "_openFilenames:store:filesArray:", objc_msgSend(v11, "sortedArrayUsingSelector:", sel_dy_numericCompare_), a3, v13);
  self->_captureFiles = v13;
  if (!v14)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v15 = (void *)objc_opt_new();
  v16 = *MEMORY[0x24BE393B8];
  objc_msgSend(v15, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x24BE393B8], v6), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  objc_msgSend(v15, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v16, v7), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  objc_msgSend(v15, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v16, v8), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  v17 = (NSArray *)objc_opt_new();
  v18 = -[DYInOrderInstructionFilesVisitor _openFilenames:store:filesArray:](self, "_openFilenames:store:filesArray:", v15, a3, v17);
  self->_deltaFiles = v17;

LABEL_14:
  objc_autoreleasePoolPop(context);
  return v18;
}

- (void)_closeFiles
{

  self->_initialPhaseFiles = 0;
  self->_deltaFiles = 0;

  self->_captureFiles = 0;
}

- (void)_performVisit:(id)a3
{
  void *v4;
  NSArray *initialPhaseFiles;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *captureFiles;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *deltaFiles;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x2426225CC](self, a2, a3);
  -[DYInOrderInstructionFilesVisitor performPreVisitActions](self, "performPreVisitActions");
  if (!self->super._abort)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    initialPhaseFiles = self->_initialPhaseFiles;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](initialPhaseFiles, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(initialPhaseFiles);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "acceptCaptureVisitor:", self);
        if (self->super._abort)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](initialPhaseFiles, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      -[DYInOrderInstructionFilesVisitor performPreCaptureVisitActions](self, "performPreCaptureVisitActions");
      if (!self->super._abort)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        captureFiles = self->_captureFiles;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](captureFiles, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
LABEL_13:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(captureFiles);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "acceptCaptureVisitor:", self);
            if (self->super._abort)
              break;
            if (v12 == ++v14)
            {
              v12 = -[NSArray countByEnumeratingWithState:objects:count:](captureFiles, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
              if (v12)
                goto LABEL_13;
              goto LABEL_19;
            }
          }
        }
        else
        {
LABEL_19:
          -[DYInOrderInstructionFilesVisitor performPostCaptureVisitActions](self, "performPostCaptureVisitActions");
          if (!self->super._abort && self->_visitDeltaFiles)
          {
            v22 = 0u;
            v23 = 0u;
            v20 = 0u;
            v21 = 0u;
            deltaFiles = self->_deltaFiles;
            v16 = -[NSArray countByEnumeratingWithState:objects:count:](deltaFiles, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v21;
LABEL_23:
              v19 = 0;
              while (1)
              {
                if (*(_QWORD *)v21 != v18)
                  objc_enumerationMutation(deltaFiles);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19), "acceptCaptureVisitor:", self);
                if (self->super._abort)
                  break;
                if (v17 == ++v19)
                {
                  v17 = -[NSArray countByEnumeratingWithState:objects:count:](deltaFiles, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
                  if (v17)
                    goto LABEL_23;
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
  objc_autoreleasePoolPop(v4);
}

- (void)visitCaptureStore:(id)a3
{
  if (-[DYInOrderInstructionFilesVisitor _openFiles:](self, "_openFiles:"))
    -[DYInOrderInstructionFilesVisitor _performVisit:](self, "_performVisit:", a3);
  -[DYInOrderInstructionFilesVisitor _closeFiles](self, "_closeFiles");
}

- (BOOL)visitDeltaFiles
{
  return self->_visitDeltaFiles;
}

- (void)setVisitDeltaFiles:(BOOL)a3
{
  self->_visitDeltaFiles = a3;
}

- (BOOL)unsorted
{
  return self->_unsorted;
}

- (void)setUnsorted:(BOOL)a3
{
  self->_unsorted = a3;
}

@end
