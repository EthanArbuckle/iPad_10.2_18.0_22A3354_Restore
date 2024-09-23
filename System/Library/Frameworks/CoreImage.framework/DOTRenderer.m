@implementation DOTRenderer

- (DOTRenderer)init
{
  DOTRenderer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOTRenderer;
  result = -[DOTRenderer init](&v3, sel_init);
  if (result)
  {
    result->direction = 1;
    result->drawEdgesFirst = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DOTRenderer;
  -[DOTRenderer dealloc](&v2, sel_dealloc);
}

- (void)setFileURL:(id)a3
{
  self->fileURL = (NSURL *)objc_msgSend(a3, "URLByAppendingPathExtension:", CFSTR("dot"));
}

- (void)setFileTitle:(id)a3
{
  self->fileTitle = (NSString *)objc_msgSend(a3, "copy");
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  FILE *file;

  file = self->file;
  if (file)
    fclose(file);
  self->file = fopen(-[NSString UTF8String](-[NSURL path](self->fileURL, "path", *(_QWORD *)&a3, *(_QWORD *)&a4), "UTF8String"), "w");
  fprintf(self->file, "digraph %s {\n", -[NSString UTF8String](-[NSArray componentsJoinedByString:](-[NSString componentsSeparatedByCharactersInSet:](self->fileTitle, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "componentsJoinedByString:", CFSTR("_")), "UTF8String"));
  fwrite("rankdir=BT;\n", 0xCuLL, 1uLL, self->file);
  return 1;
}

- (void)drawNode:(id)a3
{
  unsigned int v5;
  const char *v6;
  unsigned int v7;

  fprintf(self->file, "n%p [", a3);
  v5 = objc_msgSend(a3, "color");
  if (v5 >= 0x10)
    -[DOTRenderer drawNode:].cold.2();
  v6 = off_1E2EC3EE0[v5];
  v7 = objc_msgSend(a3, "shape");
  if (v7 >= 4)
    -[DOTRenderer drawNode:].cold.1();
  fprintf(self->file, "style=filled, shape=%s, color=black, fillcolor=\"%s\", off_1E2EC3F60[v7], v6);
  fwrite("label=<<table border=\"0\" cellborder=\"0\" cellspacing=\"0\">", 0x38uLL, 1uLL, self->file);
  if (objc_msgSend(a3, "title"))
    fprintf(self->file, "<tr><td valign='middle'><font face='Menlo'>[%s]</font></td></tr>", (const char *)objc_msgSend((id)objc_msgSend(a3, "title"), "UTF8String"));
  fprintf(self->file, "<tr><td valign='middle' balign='left'><font face='Menlo'>%s</font></td></tr>", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "label"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<br/>")), "UTF8String"));
  fwrite("</table>>", 9uLL, 1uLL, self->file);
  fwrite("];\n", 3uLL, 1uLL, self->file);
}

- (void)drawEdge:(id)a3 withPath:(id)a4
{
  fprintf(self->file, "n%p -> n%p;\n", (const void *)objc_msgSend(a3, "from"), (const void *)objc_msgSend(a3, "to"));
}

- (void)flushRender
{
  fwrite("}\n", 2uLL, 1uLL, self->file);
  fclose(self->file);
  self->file = 0;
}

- (int)direction
{
  return self->direction;
}

- (void)setDirection:(int)a3
{
  self->direction = a3;
}

- (CGSize)separation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->separation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSeparation:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->separation, &v3, 16, 1, 0);
}

- (BOOL)drawEdgesFirst
{
  return self->drawEdgesFirst;
}

- (void)setDrawEdgesFirst:(BOOL)a3
{
  self->drawEdgesFirst = a3;
}

- (void)drawNode:.cold.1()
{
  __assert_rtn("stringForGraphvizShape", "CIGVRenderer.mm", 1068, "0 && \"unreachable\");
}

- (void)drawNode:.cold.2()
{
  __assert_rtn("stringForGraphvizColor", "CIGVRenderer.mm", 1050, "0 && \"unreachable\");
}

@end
