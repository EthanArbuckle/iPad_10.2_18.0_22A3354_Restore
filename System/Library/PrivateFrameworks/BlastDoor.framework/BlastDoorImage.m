@implementation BlastDoorImage

- (id)dataUsingEncoding:(unint64_t)a3 error:(id *)a4
{
  BlastDoorImage *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = self;
  sub_1AD0CEEA4(a3);
  v7 = v6;
  v9 = v8;

  v10 = (void *)sub_1AD63AFA0();
  sub_1AD00412C(v7, v9);
  return v10;
}

- (BOOL)writeToURL:(id)a3 usingEncoding:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  BlastDoorImage *v11;
  uint64_t v13;

  v7 = sub_1AD63AF28();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD63AED4();
  v11 = self;
  sub_1AD0CF01C((uint64_t)v10, a4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return 1;
}

- (CGImage)cgImage
{
  BlastDoorImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD0CF234();

  return (CGImage *)v3;
}

- (__CVBuffer)pixelBuffer
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(id *__return_ptr, id (*)@<X0>(void *@<X0>, _QWORD *@<X8>), _QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  BlastDoorImage *v9;
  id v11;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorImage_image);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(id *__return_ptr, id (*)@<X0>(void *@<X0>, _QWORD *@<X8>), _QWORD, uint64_t, uint64_t, uint64_t))(v5 + 24);
  type metadata accessor for CVBuffer(0);
  v8 = v7;
  v9 = self;
  v6(&v11, sub_1AD0CF56C, 0, v8, v4, v5);

  return (__CVBuffer *)v11;
}

- (BlastDoorImage)init
{
  BlastDoorImage *result;

  result = (BlastDoorImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD046A30((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorImage_image));
}

@end
