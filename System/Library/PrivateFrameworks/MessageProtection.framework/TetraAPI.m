@implementation TetraAPI

+ (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 theirURI:(id)a5 theirPushToken:(id)a6 theirRegistration:(id)a7 signedByOur:(id)a8
{
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  char *v20;
  id v21;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;
  v18 = a4;
  v19 = a6;
  v20 = (char *)a7;
  v21 = a8;
  LOBYTE(v15) = specialized static TetraAPI.markForStateReset(ourURI:ourPushToken:theirURI:theirPushToken:theirRegistration:signedByOur:)(v12, v14, v18, v15, v17, v19, v20, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15 & 1;
}

+ (id)sealWithMessage:(id)a3 authenticatedData:(id)a4 guid:(id)a5 sendingURI:(id)a6 sendingPushToken:(id)a7 receivingURI:(id)a8 receivingPushToken:(id)a9 receiverRegistration:(id)a10 encryptedAttributes:(id)a11 resetState:(BOOL)a12 signedBy:(id)a13 error:(id *)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t (*v30)(uint64_t);
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  Class v44;

  v39 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v43 = a7;
  v22 = a8;
  v42 = a9;
  v35 = (char *)a10;
  v23 = a11;
  v24 = a13;
  v37 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v41 = v25;

  v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v38 = v27;
  v40 = v26;

  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v29 = v28;

  v30 = (uint64_t (*)(uint64_t))static String._unconditionallyBridgeFromObjectiveC(_:)();
  v32 = v31;

  v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v44 = specialized static TetraAPI.seal(message:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:receiverRegistration:encryptedAttributes:resetState:signedBy:)(v37, v41, v40, v38, v36, v29, v43, v30, v32, v42, v35, v33, a12, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of Data._Representation(v40, v38);
  outlined consume of Data._Representation(v37, v41);
  return v44;
}

+ (void)openWithMessage:(id)a3 authenticatedData:(id)a4 guid:(id)a5 sendingURI:(id)a6 sendingPushToken:(id)a7 receivingURI:(id)a8 receivingPushToken:(id)a9 signedBy:(id)a10 tetraVersion:(unsigned int)a11 ourPrekeys:(id)a12 ourSigningPublicKeyCompactRepresentation:(id)a13 decryptionBlock:(id)aBlock
{
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t ObjCClassMetadata;
  uint64_t v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;

  v20 = _Block_copy(aBlock);
  v45 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v48 = a7;
  v24 = a8;
  v47 = a9;
  v39 = a10;
  v25 = a12;
  v49 = a13;
  v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v27;

  v46 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v44 = v29;

  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v42 = v31;
  v43 = v30;

  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v40 = v33;
  v41 = v32;

  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v36 = v35;

  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NGMFullPrekey);
  v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v20);
  specialized static TetraAPI.open(message:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedBy:tetraVersion:ourPrekeys:ourSigningPublicKeyCompactRepresentation:decryptionBlock:)(v26, v28, v46, v44, v43, v42, v41, v40, v48, v34, v36, v47, v39, a11, v38, (uint64_t)v49, ObjCClassMetadata, (uint64_t)v20);
  _Block_release(v20);
  _Block_release(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v46, v44);
  outlined consume of Data._Representation(v26, v28);

}

- (_TtC17MessageProtection8TetraAPI)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TetraAPI();
  return -[TetraAPI init](&v3, sel_init);
}

@end
