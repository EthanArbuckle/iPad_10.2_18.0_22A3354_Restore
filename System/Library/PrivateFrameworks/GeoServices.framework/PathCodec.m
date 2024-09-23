@implementation PathCodec

+ (void)routingPathLegForData:(void *)a1@<X1>
{
  id v3;
  _BYTE *v4;
  int v5;
  id v6;

  v3 = a1;
  objc_opt_self();
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg(a2, 0);
  v6 = objc_retainAutorelease(v3);
  v4 = (_BYTE *)objc_msgSend(v6, "bytes");
  v5 = objc_msgSend(v6, "length");
  (*(void (**)(maps::path_codec::geo3::RoutingPathLeg *))(*(_QWORD *)a2 + 40))(a2);
  google::protobuf::internal::MergeFromImpl<false>(v4, v5, a2, 1);

}

+ (uint64_t)dataForRoutingPathLeg:(uint64_t)a1
{
  int v3;
  char *v4;

  objc_opt_self();
  v3 = (*(uint64_t (**)(google::protobuf::MessageLite *))(*(_QWORD *)a2 + 72))(a2);
  v4 = (char *)malloc_type_malloc(v3, 0x5CE9AD7CuLL);
  google::protobuf::MessageLite::SerializePartialToArray(a2, v4, v3);
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, v3, 1);
}

+ (void)decompressInPlace:(uint64_t)a1
{
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  objc_opt_self();
  v6 = 0;
  v3[0] = 0x4039000000000000;
  v3[1] = 5000;
  v4 = xmmword_189CC0500;
  v5 = xmmword_189CC0510;
  v7 = 20000000;
  v8 = 0x3FF199999999999ALL;
  v9 = 0x3E800002710;
  v10 = 0xA00002710;
  v11 = xmmword_189CC0520;
  v12 = 0x3FE6147AE147AE14uLL;
  maps::path_codec::decompress_inplace((uint64_t)v3, a2);
}

+ (void)compress:(const maps:(maps::path_codec::geo3::RoutingPathLeg *)a2@<X8> :path_codec::geo3::RoutingPathLeg *)a1@<X1>
{
  _QWORD v4[2];
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  objc_opt_self();
  v7 = 0;
  v4[0] = 0x4039000000000000;
  v4[1] = 5000;
  v5 = xmmword_189CC0500;
  v6 = xmmword_189CC0510;
  v8 = 20000000;
  v9 = 0x3FF199999999999ALL;
  v10 = 0x3E800002710;
  v11 = 0xA00002710;
  v12 = xmmword_189CC0520;
  v13 = 0x3FE6147AE147AE14uLL;
  maps::path_codec::compress((uint64_t)v4, a1, a2);
}

@end
