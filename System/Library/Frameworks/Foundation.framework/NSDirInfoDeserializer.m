@implementation NSDirInfoDeserializer

- (id)deserializePListValueIn:(id)a3 key:(id)a4 length:(unint64_t)a5
{
  NSDocInfo *v6;
  int v7;
  char v8;
  char v9;

  v6 = -[NSDocInfo init](+[NSDocInfo allocWithZone:](NSDocInfo, "allocWithZone:", -[NSDirInfoDeserializer zone](self, "zone", a3, a4, a5)), "init");
  v6->time = (int)objc_msgSend(self->super.ds, "readInt");
  v6->mode = objc_msgSend(self->super.ds, "readInt");
  v7 = objc_msgSend(self->super.ds, "readInt");
  v8 = objc_msgSend(self->super.ds, "readInt");
  v9 = v7 + 3;
  if (v7 >= 0)
    v9 = v7;
  *(&v6->mode + 1) = *(&v6->mode + 1) & 0xFFF8 | v7 & 1 | v9 & 4 | (2 * (v8 & 1));
  return v6;
}

@end
