@implementation MTLDebugLocation

- (MTLDebugSubProgram)scope
{
  return (MTLDebugSubProgram *)-[MTLDebugInstrumentationData debugSubProgramForID:](self->_data, "debugSubProgramForID:", self->_debugLoc->var0);
}

- (unsigned)line
{
  return self->_debugLoc->var1;
}

- (unsigned)column
{
  return self->_debugLoc->var2;
}

- (MTLDebugLocation)inlinedAt
{
  if (self->_debugLoc->var3 == -1)
    return 0;
  else
    return (MTLDebugLocation *)-[MTLDebugInstrumentationData debugLocationForID:](self->_data, "debugLocationForID:");
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[7];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u"), -[MTLDebugSubProgram filename](-[MTLDebugLocation scope](self, "scope"), "filename"), -[MTLDebugLocation line](self, "line"));
  if (-[MTLDebugLocation inlinedAt](self, "inlinedAt"))
  {
    v12[0] = v5;
    v12[1] = CFSTR("filename =");
    v12[2] = v6;
    v12[3] = CFSTR("function =");
    v12[4] = -[MTLDebugSubProgram name](-[MTLDebugLocation scope](self, "scope"), "name");
    v12[5] = CFSTR("column =");
    v12[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MTLDebugLocation column](self, "column"));
    v12[7] = CFSTR("inlinedAt");
    v12[8] = -[MTLDebugLocation formattedDescription:](-[MTLDebugLocation inlinedAt](self, "inlinedAt"), "formattedDescription:", v4);
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v12;
    v9 = 9;
  }
  else
  {
    v11[0] = v5;
    v11[1] = CFSTR("filename =");
    v11[2] = v6;
    v11[3] = CFSTR("function =");
    v11[4] = -[MTLDebugSubProgram name](-[MTLDebugLocation scope](self, "scope"), "name");
    v11[5] = CFSTR("column =");
    v11[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MTLDebugLocation column](self, "column"));
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v11;
    v9 = 7;
  }
  return (id)objc_msgSend((id)objc_msgSend(v7, "arrayWithObjects:count:", v8, v9), "componentsJoinedByString:", CFSTR(" "));
}

- (id)description
{
  return -[MTLDebugLocation formattedDescription:](self, "formattedDescription:", 0);
}

- (void)releaseInternal
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLDebugLocation;
  -[MTLDebugLocation release](&v2, sel_release);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLDebugLocation;
  -[MTLDebugLocation dealloc](&v2, sel_dealloc);
}

@end
