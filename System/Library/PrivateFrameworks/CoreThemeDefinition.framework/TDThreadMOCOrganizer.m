@implementation TDThreadMOCOrganizer

- (void)setThreadMOC:(id)a3
{
  void *v5;

  if (!self->mainThread)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDThreadMOCOrganizer.m"), 18, CFSTR("Must set mainThread before using -[TDThreadMOCOrganizer setThreadMOC:]"));
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  if (!a3 || v5 == -[TDThreadMOCOrganizer mainThread](self, "mainThread"))
    objc_msgSend((id)objc_msgSend(v5, "threadDictionary"), "removeObjectForKey:", CFSTR("TDThreadMOC"));
  else
    objc_msgSend((id)objc_msgSend(v5, "threadDictionary"), "setObject:forKey:", a3, CFSTR("TDThreadMOC"));
}

- (id)mainThread
{
  id result;

  result = self->mainThread;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDThreadMOCOrganizer.m"), 29, CFSTR("-[TDThreadMOCOrganizer mainThread] called with mainThread not set"));
    return self->mainThread;
  }
  return result;
}

- (id)document
{
  return self->document;
}

- (id)mainMOC
{
  return (id)objc_msgSend(-[TDThreadMOCOrganizer document](self, "document"), "managedObjectContext");
}

- (id)threadMOC
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  if (v3 == -[TDThreadMOCOrganizer mainThread](self, "mainThread"))
    return -[TDThreadMOCOrganizer mainMOC](self, "mainMOC");
  v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "threadDictionary"), "objectForKey:", CFSTR("TDThreadMOC"));
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    objc_msgSend(v4, "setPersistentStoreCoordinator:", objc_msgSend(-[TDThreadMOCOrganizer mainMOC](self, "mainMOC"), "persistentStoreCoordinator"));
    objc_msgSend(v4, "setUndoManager:", 0);
    -[TDThreadMOCOrganizer setThreadMOC:](self, "setThreadMOC:", v4);

  }
  return v4;
}

- (TDThreadMOCOrganizer)init
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDThreadMOCOrganizer.m"), 64, CFSTR("-[TDThreadMOCOrganizer init] not allowed. Use -[TDThreadMOCOrganizer initWithDocument:mainThread:]"));
  return 0;
}

- (TDThreadMOCOrganizer)initWithDocument:(id)a3 mainThread:(id)a4
{
  TDThreadMOCOrganizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TDThreadMOCOrganizer;
  v7 = -[TDThreadMOCOrganizer init](&v9, sel_init);
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("TDThreadMOCOrganizer.m"), 71, CFSTR("-[TDThreadMOCOrganizer initWithDocument:mainThread:] called with nil document"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("TDThreadMOCOrganizer.m"), 72, CFSTR("-[TDThreadMOCOrganizer initWithDocument:mainThread:] called with nil thread"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v7->mainThread = (NSThread *)a4;
  v7->document = (CoreThemeDocument *)a3;
  return v7;
}

@end
